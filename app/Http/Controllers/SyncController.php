<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Session;


class SyncController extends Controller
{

    public function getLiveProductsData()
    {
        $live_db = DB::connection('mysql_2');
        $local_db = DB::connection('mysql');
        $business_verfiy = $local_db->table('business')->first();
        $location_verfiy = $local_db->table('business_locations')->first();

        // check for unexpected click on get products
        $local_sync_check = $local_db->table('transactions')
            ->whereIn('type', ['sell'])
            ->where('sync_status', 0)
            ->latest('ai_id')->count();

        if ($local_sync_check > 0) {
            Session::flash('product-error', 'Last Sale Not Synced');
            return redirect()->back();
        } else {
            try {
                DB::beginTransaction();

                // Update local Business Setting
                $get_business_setting = $live_db->table('business')
                    ->where('id', $business_verfiy->id)
                    ->first();

                $local_db->table('business')
                    ->where('id', $business_verfiy->id)
                    ->update((array) $get_business_setting);

                // Get Brands, Units, Categories, Warranties, Expense Categories 'invoice_schemes', 'invoice_layouts','expense_categories', 'contacts', 'notification_templates', 'types_of_services'
                $cat_unit_brands_table = [
                    'invoice_schemes',
                    'invoice_layouts',
                    'categories',
                    'units',
                    'brands',
                    'warranties',
                    'expense_categories',
                    'contacts',
                    'notification_templates',
                    'types_of_services',
                    'tax_rates'
                ];

                try {

                    foreach ($cat_unit_brands_table as $c_u_b) {

                        $c_u_b_query = $live_db->table($c_u_b)->where('business_id', $business_verfiy->id);

                        if ($c_u_b_query->count() > 0) {
                            $c_u_b_records = $c_u_b_query->get();

                            foreach ($c_u_b_records as $c_u_b_record) {
                                try {
                                    $local_db->table($c_u_b)
                                        ->updateOrInsert(['id' => $c_u_b_record->id], (array)$c_u_b_record);
                                } catch (Exception $e) {
                                    DB::rollBack();
                                    return dd($e);
                                }
                            }
                        }
                    }
                } catch (Exception $e) {
                    DB::rollBack();
                    return dd($e);
                }

                // Fetch Type of Services
                $res_tables_query = $live_db->table('res_tables')
                    ->where('business_id', $business_verfiy->id)
                    ->where('location_id', $location_verfiy->id);

                $res_tables_count = $res_tables_query->count();

                if ($res_tables_count > 0) {
                    $res_tables_records = $res_tables_query->get();

                    foreach ($res_tables_records as $res_tables_row) {
                        $local_db->table('res_tables')
                            ->updateOrInsert(['id' => $res_tables_row->id], (array) $res_tables_row);
                    }
                }


                // Fetch Variation Templates 
                // also include Variation Value Templates
                $variation_templates_table_records_count = $live_db->table('variation_templates')
                    ->where('business_id', $business_verfiy->id)->count();

                if ($variation_templates_table_records_count > 0) {
                    $get_variation_templates_table_records = $live_db->table('variation_templates')
                        ->where('business_id', $business_verfiy->id)
                        ->get();

                    foreach ($get_variation_templates_table_records as $variation_templates_table_record) {
                        try {
                            $local_db->table('variation_templates')
                                ->updateOrInsert([
                                    'id' => $variation_templates_table_record->id
                                ], (array)$variation_templates_table_record);

                            //Fetch Variation Value Templates 
                            $get_variation_value_templates_table_records = $live_db->table('variation_value_templates')
                                ->where('variation_template_id', $variation_templates_table_record->id)
                                ->get();

                            foreach ($get_variation_value_templates_table_records as $variation_value_templates_table_record) {

                                try {
                                    // Insert into variation_value_templates of local DB
                                    $local_db->table('variation_value_templates')->updateOrInsert([
                                        'id' => $variation_value_templates_table_record->id
                                    ], (array)$variation_value_templates_table_record);
                                } catch (Exception $e) {
                                    DB::rollBack();
                                    Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                                    $output = __("messages.something_went_wrong");
                                    return $e;
                                }
                            }
                        } catch (Exception $e) {
                            DB::rollBack();
                            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                            $output = __("messages.something_went_wrong");
                            return $e;
                            // return redirect()->back()->with('error', $output);
                        }
                    }
                }

                // Fetch Records From products Locations Table
                $product_locations_table_query = $live_db->table('product_locations')
                    ->where('location_id', $location_verfiy->id);

                $product_locations_table_records_count = $product_locations_table_query->count();

                // check count of product_locations table
                $vls_arr = [];
                if ($product_locations_table_records_count > 0) {
                    // Records From Products Locations Table
                    $get_product_locations_table_records = $product_locations_table_query->get();

                    foreach ($get_product_locations_table_records as $product_locations_record) {

                        // Ftech Product based on location
                        $products_table_record = $live_db->table('products')
                            ->where('id', $product_locations_record->product_id)
                            ->first();

                        if ($products_table_record) {
                            // insert or update local DB products table
                            // insert or update local DB product_locations table
                            try {
                                // local DB products table
                                $local_db->table('products')->updateOrInsert(
                                    ['id' => $products_table_record->id],
                                    (array)$products_table_record
                                );

                                // local DB product_locations table
                                $check_local_product_location_count = $local_db->table('product_locations')
                                    ->where('product_id', $products_table_record->id)
                                    ->where('location_id', $product_locations_record->location_id)
                                    ->count();

                                if ($check_local_product_location_count > 0) {
                                    $local_db->table('product_locations')->updateOrInsert([
                                        'product_id' => $products_table_record->id,
                                        'location_id' => $product_locations_record->location_id
                                    ]);
                                } else {
                                    $local_db->table('product_locations')->insert((array)$product_locations_record);
                                }
                            } catch (Exception $e) {
                                DB::rollBack();
                                return $e;
                            }
                            // Get Record From product_variations 
                            $product_variation_record = $live_db->table('product_variations')
                                ->where('product_id', $products_table_record->id)
                                ->first();

                            if ($product_variation_record) {
                                // Insert Record into local DB product_variations table
                                try {
                                    $local_db->table('product_variations')
                                        ->updateOrInsert(['id' => $product_variation_record->id], (array) $product_variation_record);
                                } catch (Exception $e) {
                                    DB::rollBack();
                                    return $e;
                                }
                            }
                            // Fectch Records Variations Table
                            $variation_table_records = $live_db->table('variations')
                                ->where('product_id', $products_table_record->id);

                            $variation_table_records_count = $variation_table_records->count();

                            if ($variation_table_records_count > 0) {
                                $get_variation_table_records = $variation_table_records->get();

                                foreach ($get_variation_table_records as $variation_record) {
                                    // Fetch Variation Location Details
                                    try {
                                        $local_db->table('variations')->updateOrInsert(['id' => $variation_record->id], (array)$variation_record);
                                        // Get data from v_L_d table
                                        $v_l_s_records = $live_db->table('variation_location_details')
                                            ->where('product_id', $products_table_record->id)
                                            ->where('location_id', $location_verfiy->id)
                                            ->where('product_variation_id', $product_variation_record->id)
                                            ->where('variation_id', $variation_record->id)
                                            ->first();
                                        if ($v_l_s_records) {
                                            $vls_arr[] = $v_l_s_records;
                                            $local_db->table('variation_location_details')
                                                ->updateOrInsert(['id' => $v_l_s_records->id], (array)$v_l_s_records);
                                        }
                                    } catch (Exception $e) {
                                        DB::rollBack();
                                        return $e;
                                    }
                                }
                            }

                            // GET PRODUCT IMAGE
                            $url_path = "http://localhost/main_pos_1/uploads/img/";
                            $url1 = $url_path . $products_table_record->image;
                            $name = substr($url1, strrpos($url1, '/') + 1);
                            if (($data = @file_get_contents($url1)) === false) {
                                $error = error_get_last();
                                $err[] = $products_table_record->name;
                            } else {
                                $err[] = $products_table_record->name;
                                if ($contents = file_get_contents($url1)) {
                                    Storage::put('img/' . $name, $contents);
                                } else {
                                    $err[] = "No Data";
                                }
                            }
                        }
                    }
                }

                // Get Modifiers from Product Table
                $product_modifier_query = $live_db->table('products')
                    ->where('type', 'modifier')
                    ->where('business_id', $business_verfiy->id);

                if ($product_modifier_query->count() > 0) {
                    $product_modifiers = $product_modifier_query->get();

                    foreach ($product_modifiers as $modifier) {
                        $local_db->table('products')->updateOrInsert(['id' => $modifier->id], (array)$modifier);
                        //   Fetch Res Modifiers SET  
                        $product_modifier_sets = $live_db->table('res_product_modifier_sets')
                            ->where('modifier_set_id', $modifier->id)
                            ->get();

                        foreach ($product_modifier_sets  as  $p_m_s_record) {
                            // insert Res Modifiers SET
                            $local_db->table('res_product_modifier_sets')->updateOrInsert([
                                'modifier_set_id' => $p_m_s_record->modifier_set_id,
                                'product_id' => $p_m_s_record->product_id
                            ], (array) $p_m_s_record);
                        }
                        // Fetch Product Variations For Modifers
                        $modifier_product_variation = $live_db->table('product_variations')
                            ->where('product_id', $modifier->id)
                            ->first();

                        $local_db->table('product_variations')
                            ->updateOrInsert(['id' => $modifier_product_variation->id], (array)$modifier_product_variation);

                        //    Fetch Variations For Modifiers
                        $variations_for_modifier = $live_db->table('variations')->where('product_id', $modifier->id)->get();

                        foreach ($variations_for_modifier as $variation_for_modifier) {
                            $local_db->table('variations')
                                ->updateOrInsert(['id' => $variation_for_modifier->id], (array)$variation_for_modifier);
                        }
                    }
                }

                // Fetch Transaction based on type and location
                $get_transaction_records = $live_db->table('transactions')
                    ->where('business_id', $business_verfiy->id)
                    ->where('location_id', $location_verfiy->id)
                    ->whereIn('type', ['opening_stock', 'purchase'])
                    ->get();

                foreach ($get_transaction_records as $transaction_records) {
                    $transaction_records_without_ai_id = Arr::except((array)$transaction_records, ['ai_id']);

                    // insert into local DB transaction table
                    $local_db->table('transactions')->updateOrInsert(['id' => $transaction_records->id], $transaction_records_without_ai_id);

                    //Get Live DB Purchae line records based on transaction id
                    $purchase_line_record = $live_db->table('purchase_lines')
                        ->where('transaction_id', $transaction_records->id)
                        ->first();

                    // insert into local DB purchase_lines table
                    $local_db->table('purchase_lines')
                        ->updateOrInsert(['id' => $purchase_line_record->id], (array)$purchase_line_record);
                }



                DB::commit();
                Session::flash('product-message', 'Data Received Successfully');
                return redirect()->back();
            } catch (Exception $e) {
                DB::rollBack();
                Session::flash('product-error', 'Something Went Wrong, Please Try Again.');
                // return dd($e);
                return redirect()->back();
            }
        }
    }


    public function syncSellPosSaleModuleOnly()
    {
        $business_id = request()->session()->get('user.business_id');
        // $location_id = 1;
        $salesTables =  [
            'contacts', 'transactions', 'transaction_payments',
            'transaction_sell_lines', 'cash_registers', 'cash_register_transactions'
        ];

        $live_db = DB::connection('mysql_2');
        $local_db = DB::connection('mysql');

        try {
            $check_cash_status_count = $local_db->table('cash_registers')->where('status', 'open')->count();

            if ($check_cash_status_count > 0) {
                Session::flash('sales-sync-error', 'Please Close Cash Register.');
                return redirect()->back();
            } else {

                DB::beginTransaction();
                DB::connection('mysql_2')->beginTransaction();

                // Get Supplier
                $get_suppliers = $live_db->table('contacts')->where('type', 'supplier')->where('business_id', $business_id)->get();

                if ($get_suppliers) {
                    foreach ($get_suppliers as $supplier) {
                        $local_db->table('contacts')->updateOrInsert(['id' => $supplier->id], (array) $supplier);
                    }
                }

                // check VLD table for quantity update
                $get_sale_table_records = $local_db->table('variation_location_details')->get();

                foreach ($get_sale_table_records as $sale_table_rcord) {
                    $live_qty_available = $live_db->table('variation_location_details')
                        ->where('id', $sale_table_rcord->id)
                        ->pluck('qty_available')
                        ->first();

                    $sold_qty_count = $local_db->table('transaction_sell_lines')
                        ->where('sync_status', 0)
                        ->where('product_id', $sale_table_rcord->product_id)
                        ->where('variation_id', $sale_table_rcord->variation_id)
                        ->sum('quantity');

                    // vld quantity left
                    $qty_left = $live_qty_available - $sold_qty_count;
                    $sale_table_record_without_qty = Arr::except((array)$sale_table_rcord, ['qty_available']);
                    $qty_to_update = $qty_left;
                    $v_l_d_record = $sale_table_record_without_qty + ['qty_available' => $qty_to_update];

                    // update live vld table
                    $live_db->table('variation_location_details')
                        ->updateOrInsert(['id' => $sale_table_rcord->id], (array)$v_l_d_record);
                    // update local vld table
                    $local_db->table('variation_location_details')
                        ->updateOrInsert(['id' => $sale_table_rcord->id], (array)$v_l_d_record);

                    // purchase line records 
                    $p_line_records = $local_db->table('purchase_lines')
                        ->where('product_id', $sale_table_rcord->product_id)
                        ->where('variation_id', $sale_table_rcord->variation_id)
                        ->get();

                    foreach ($p_line_records as $p_line) {
                        $live_db->table('purchase_lines')
                            ->updateOrInsert(['id' => $p_line->id], (array) $p_line);
                    }

                    // get new records   in case of stock update                 
                    $p_line_records = $live_db->table('purchase_lines')
                        ->where('product_id', $sale_table_rcord->product_id)
                        ->where('variation_id', $sale_table_rcord->variation_id)
                        ->get();

                    foreach ($p_line_records as $p_line) {
                        // update local purchase_lines
                        $local_db->table('purchase_lines')
                            ->updateOrInsert(['id' => $p_line->id], (array) $p_line);

                        $get_transaction_record_4_p_line = $live_db->table('transactions')
                            ->where('id', $p_line->transaction_id)
                            ->first();
                        $transaction_without_ai_id = Arr::except((array)$get_transaction_record_4_p_line, ['ai_id']);

                        $local_db->table('transactions')->updateOrInsert(
                            [
                                'id' => $get_transaction_record_4_p_line->id,
                            ],
                            $transaction_without_ai_id
                        );
                    }
                }

                // sale sync start
                foreach ($salesTables as $salesTable) {

                    $get_sale_table_records = $local_db->table($salesTable)
                        ->where('sync_status', 0)->get();

                    foreach ($get_sale_table_records as $data) {
                        $data_as_array = (array) $data;

                        $data_without_a_id = Arr::except($data_as_array, ['ai_id', 'sync_status']);
                        $data_without_a_id_sync_status = $data_without_a_id + ['sync_status' => 0];

                        if (
                            $live_db->table($salesTable)->updateOrInsert(
                                ['id' => $data_as_array['id']],
                                $data_without_a_id_sync_status
                            )
                        ) {
                            $local_db->table($salesTable)
                                ->where('id', $data_as_array['id'])
                                ->update(['sync_status' => 1]);
                        }
                    }
                }
                // Tables [VLD, purchase_line, transaction sell line purchase lines]
                $stock_1_tables = ['transaction_sell_lines_purchase_lines', 'purchase_lines', 'invoice_schemes'];

                foreach ($stock_1_tables as $table) {
                    $get_sale_table_records = $local_db->table($table)->get();

                    foreach ($get_sale_table_records as $sale_table_rcord) {
                        $live_db->table($table)->updateOrInsert(['id' => $sale_table_rcord->id], (array)$sale_table_rcord);
                    }
                }


                DB::commit();
                try {
                    DB::connection('mysql_2')->commit();
                } catch (Exception $e) {
                    throw $e;
                    Session::flash('sales-sync-error', 'Something Went Wrong, Please Try Again.');
                    return redirect()->back();
                }
                Session::flash('sales-sync-success', 'Sales Synced Successfully');
                return redirect()->back();
                return view('sale_pos.sync_status');
            }
        } catch (Exception $e) {
            DB::rollBack();
            DB::connection('mysql_2')->rollBack();
            dd($e);
            Session::flash('sales-sync-error', 'Something Went Wrong, Please Try Again.');
            // return redirect()->back();
            throw $e;
        }
    }



    public function syncSellPosSaleModuleOnlyCash()
    {
        $business_id = request()->session()->get('user.business_id');
        $location_id = 1;


        $salesTables =  ['cash_registers', 'cash_register_transactions'];
        $live_db = DB::connection('mysql_2');
        $local_db = DB::connection('mysql');
        try {
            $i = 0;
            foreach ($salesTables as $salesTable) {

                $get_sale_table_records = $local_db->table($salesTable)->get();

                foreach ($get_sale_table_records as $data) {
                    $data_as_array = (array) $data;

                    // $data_without_a_id = Arr::except($data_as_array, ['ai_id', 'sync_status']);
                    // $data_without_a_id_sync_status = $data_without_a_id + ['sync_status' => 1];

                    if ($live_db->table($salesTable)->updateOrInsert(['id' => $data_as_array['id']], $data_as_array)) {
                        // $local_db->table($salesTable)->where('id', $data_as_array['id'])->update(['sync_status' => 1]);
                        $i++;
                    }
                }
            }

            DB::commit();
            return view('sale_pos.sync_status');
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }




    public function syncSalesModuleTables()
    {
        // $test_table_array = ['transactions', 'activity_log', 'cash_register_transactions', 'purchase_lines', 'reference_counts', 'transaction_payments', 'transaction_sell_lines', 'transaction_sell_lines_purchase_lines', 'variation_location_details'];
        // $all_tables = array_map('reset', $live_db->select('SHOW TABLES'));
        // $selected_tables = array_except($all_tables, 3);

        $business_id = 1;
        $business_location_id = 1;
        $test_table_array = ['transactions'];
        $live_db = DB::connection('mysql_2');
        $local_db = DB::connection('mysql');
        $i = 0;
        foreach ($test_table_array as $selected_table) {
            $table_name = $local_db->table($selected_table)
                ->where('sync_status', 0)
                ->where('business_id', $business_id)
                ->where('location_id', $business_location_id)
                ->get();
            foreach ($table_name as $data) {
                $row_data_array = (array) $data;
                $filter = array_filter($row_data_array);
                $row_data_without_id_sync_status = Arr::except($filter, ['id', 'sync_status']);
                $row_data_without_id_but_sync_status = $row_data_without_id_sync_status + ['sync_status' => 1];
                if ($live_db->table($selected_table)->insert($row_data_without_id_but_sync_status)) {
                    $local_db->table($selected_table)->where('id', $data->id)->update(['sync_status' => 1]);
                    $i++;
                }
            }
        }
        dd($i);
    }


    // public function syncTablesB()
    // {
    //     // dd(rand(0, 99999999999999999));
    //     // dd(mt_rand(mt_rand(0, 999), mt_rand(0, 999999999999)));
    //     $business_id = 1;
    //     $business_location_id = 1;
    //     // $test_table_array = ['transactions', 'activity_log', 'cash_register_transactions', 'purchase_lines', 'reference_counts', 'transaction_payments', 'transaction_sell_lines', 'transaction_sell_lines_purchase_lines', 'variation_location_details'];
    //     $test_table_array = ['transactions'];
    //     $live_db = DB::connection('mysql_2');
    //     $local_db = DB::connection('mysql');
    //     $all_tables = array_map('reset', $live_db->select('SHOW TABLES'));
    //     $exclude_tables = ['activity_log'];
    //     $selected_tables = array_except($all_tables, 3);
    //     $i = 0;
    //     foreach ($test_table_array as $selected_table) {
    //         // dd($selected_table);
    //         // $this->getLiveDbData($live_db, $local_db, $selected_table, $business_id, $business_location_id, $i);
    //         // dd($i);
    //         $this->sendLocalData($live_db, $local_db, $selected_table, $business_id, $business_location_id, $i);
    //         // dd("No Function");
    //         // $live_db_row_count = $live_db->table($selected_table)
    //         //     ->where('business_id', $business_id)
    //         //     ->where('location_id', $business_location_id)
    //         //     ->count();
    //         // // dd($live_db_row_count);
    //         // $local_db_row_count = $local_db->table($selected_table)
    //         //     ->where('business_id', $business_id)
    //         //     ->where('location_id', $business_location_id)->count();
    //         // // dd($local_db_row_count);
    //         // //$live_db_row_count > $local_db_row_count
    //         // if (2 == 3) {
    //         //     $local_table_last_row_id = $local_db->table($selected_table)->select('id')->latest('id')->first();
    //         //     $table_name = $live_db->table($selected_table)->where('id', '>', $local_table_last_row_id->id)->get();
    //         //     foreach ($table_name as $data) {
    //         //         $array_data = (array) $data;
    //         //         if ($local_db->table($selected_table)->updateOrInsert(['id' => $array_data['id']], $array_data)) {
    //         //             $i++;
    //         //         }
    //         //     }
    //         // } else {
    //         //     $live_table_last_row_id = $live_db->table($selected_table)
    //         //         ->select('id')
    //         //         ->where('business_id', $business_id)
    //         //         ->where('location_id', $business_location_id)
    //         //         ->latest('id')->first();

    //         //     dd($live_table_last_row_id);
    //         //     $table_name = $local_db->table($selected_table)->where('id', '>', $live_table_last_row_id->id)->get();
    //         //     foreach ($table_name as $data) {
    //         //         $array_data = (array) $data;
    //         //         if ($live_db->table($selected_table)->updateOrInsert(['id' => $array_data['id']], $array_data)) {
    //         //             $i++;
    //         //         }
    //         //     }
    //         // }
    //     }
    //     dd($i);
    // }


    public function getLiveDbData($live_db, $local_db, $selected_table, $business_id, $business_location_id, $i)
    {
        // dd("getLiveDbData");
        // $local_table_last_row_id = $local_db->table($selected_table)
        // ->select('id')
        // ->where('business_id', $business_id)
        // ->where('location_id', $business_location_id)
        // ->latest('id')
        // ->first();
        $table_name = $live_db->table($selected_table)
            // ->where('id', '>', $local_table_last_row_id->id)
            ->where('sync_status', 'Online')
            ->where('business_id', $business_id)
            ->where('location_id', $business_location_id)
            ->get();
        // dd($table_name);
        foreach ($table_name as $data) {
            $array_data = (array) $data;
            $filter = array_filter($array_data);
            $data_without_id = array_except($filter, 'id');

            $check_local_db_4_record = $local_db->table($selected_table)
                ->where('business_id', $business_id)
                ->where('location_id', $business_location_id)
                ->where('sync_status', 'Offline')
                ->where('id', $array_data['id'])
                ->count();

            if ($check_local_db_4_record > 0) {
                if ($local_db->table($selected_table)->insert($data_without_id)) {
                    dd("True");
                } else {
                    dd("False");
                }
            } else {
                dd("count = 0");
            }

            dd($check_local_db_4_record);

            // dd($data_without_id);
            if ($local_db->table($selected_table)
                ->where('business_id', $business_id)
                ->where('location_id', $business_location_id)
                ->where('sync_status', 'Offline')
                ->where('id', $array_data['id'])
                ->updateOrInsert(['sync_status' => 'Online'], $data_without_id)
            ) {
                $i++;
                // dd($i . "YESSS");
            }
        }
        dd("NO");
        // return $i;
    }

    public function sendLocalData($live_db, $local_db, $selected_table, $business_id, $business_location_id, $i)
    {
        // dd("sendLocalDbData");
        $table_name = $local_db->table($selected_table)
            // ->where('sync_status', 'Offline')
            ->where('business_id', $business_id)
            ->where('location_id', $business_location_id)
            ->get();
        // dd($table_name);
        foreach ($table_name as $data) {
            $array_data = (array) $data;
            // dd($array_data);
            if ($live_db->table($selected_table)
                // ->where('business_id', $business_id)
                // ->where('location_id', $business_location_id)
                ->updateOrInsert(['id' => '99'], $array_data)
            ) {
                dd("HEllo");
                $i++;
            }
        }
        return $i;
    }


    public function syncSalesModuleTablesTest()
    {
        // $test_table_array = ['transactions', 'activity_log', 'cash_register_transactions', 'purchase_lines', 'reference_counts', 'transaction_payments', 'transaction_sell_lines', 'transaction_sell_lines_purchase_lines', 'variation_location_details'];
        // $all_tables = array_map('reset', $live_db->select('SHOW TABLES'));
        // $selected_tables = array_except($all_tables, 3);

        $business_id = 1;
        $business_location_id = 1;
        $transaction_table = 'transactions';
        $trans_dep_tables = ['transaction_sell_lines', 'transaction_payments'];
        $trans_sell_lines_table = 'transaction_sell_lines';
        $live_db = DB::connection('mysql_2');
        $local_db = DB::connection('mysql');
        $i = 0;
        $table_name = $local_db->table($transaction_table)
            ->where('sync_status', 0)
            ->where('business_id', $business_id)
            ->where('location_id', $business_location_id)
            ->get();
        foreach ($table_name as $data) {
            $row_data_array = (array) $data;
            $filter = array_filter($row_data_array);
            $row_data_without_id_sync_status = Arr::except($filter, ['id', 'sync_status']);
            $row_data_without_id_but_sync_status = $row_data_without_id_sync_status + ['sync_status' => 1];
            if ($trans_id = $live_db->table($transaction_table)->insertGetId($row_data_without_id_but_sync_status)) {
                // update local DB transaction_table column sync_status to True
                $local_db->table($transaction_table)->where('id', $data->id)->update(['sync_status' => 1]);
                foreach ($trans_dep_tables as $trans_dep_table) {
                    foreach ($local_db->table($trans_dep_table)->where('transaction_id', $data->id)->get()
                        as $data) {
                        // trun object to array
                        $trans_dep_table_data = array_filter((array) $data);
                        // reduce array to what we want to send 
                        $trans_dep_table_data_without_id = Arr::except($trans_dep_table_data, ['id', 'transaction_id']);
                        $trans_dep_table_data = $trans_dep_table_data_without_id + ['transaction_id' => $trans_id];
                        $live_sell_id = $live_db->table($trans_dep_table)->insertGetId($trans_dep_table_data);
                    }
                }

                $i++;
            }
        }

        dd([$live_sell_id, $i]);
    }
}
