<?php

# Block 1


// SYNC_PRO
// Get Brands, Units, Categories, Warranties, Expense Categories 'invoice_schemes', 'invoice_layouts'
$cat_unit_brands_table = ['invoice_schemes', 'invoice_layouts', 'categories', 'units', 'brands', 'warranties', 'expense_categories', 'contacts', 'notification_templates'];
try {
    foreach ($cat_unit_brands_table as $c_u_b) {
        $c_u_b_query = $live_db->table($c_u_b)->where('business_id', $business_verfiy->id);
        if ($c_u_b_query->count() > 0) {
            $c_u_b_records = $c_u_b_query->get();
            foreach ($c_u_b_records as $c_u_b_record) {
                try {
                    $local_db->table($c_u_b)->updateOrInsert(['id' => $c_u_b_record->id], (array)$c_u_b_record);
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


# Block 2

// Fetch Data From live DB variation_templates table
$variation_templates_table_records_count = $live_db->table('variation_templates')->where('business_id', $business_verfiy->id)->count();
if ($variation_templates_table_records_count > 0) {
    $get_variation_templates_table_records = $live_db->table('variation_templates')->where('business_id', $business_verfiy->id)->get();
    // dd($get_variation_templates_table_records);
    foreach ($get_variation_templates_table_records as $variation_templates_table_record) {
        // dd($variation_templates_table_record);
        try {
            $local_db->table('variation_templates')->updateOrInsert(['id' => $variation_templates_table_record->id], (array)$variation_templates_table_record);

            //Fetch variation_value_templates from Live DB
            $get_variation_value_templates_table_records = $live_db->table('variation_value_templates')->where('variation_template_id', $variation_templates_table_record->id)->get();

            foreach ($get_variation_value_templates_table_records as $variation_value_templates_table_record) {
                try {
                    // Insert into variation_value_templates of local DB
                    $local_db->table('variation_value_templates')->updateOrInsert(['id' => $variation_value_templates_table_record->id], (array)$variation_value_templates_table_record);
                } catch (Exception $e) {
                    DB::rollBack();
                    Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                    $output = __("messages.something_went_wrong");
                    return $e;
                    // return redirect()->back()->with('error', $output);
                }
            }
            // dd(true);
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
// $this->$syncUtil->getProducts();
$product_locations_table_query = $live_db->table('product_locations')->where('location_id', $location_verfiy->id);
$product_locations_table_records_count = $product_locations_table_query->count();
// dd($product_locations_table_records_count);
// check count of product_locations table






# Block 3

if ($product_locations_table_records_count > 0) {
    // Records From products Locations Table
    $get_product_locations_table_records = $product_locations_table_query->get();
    // dd($get_product_locations_table_records);

    foreach ($get_product_locations_table_records as $product_locations_record) {
        // dd($product_locations_record);
        // Get Product based on location
        $products_table_record = $live_db->table('products')->where('id', $product_locations_record->product_id)->first();
        // dd($products_table_record);
        if ($products_table_record) {
            try {
                // insert or update local DB products table
                $local_db->table('products')->updateOrInsert(['id' => $products_table_record->id], (array)$products_table_record);
                // insert or update local DB product_locations table
                $check_local_product_location_count = $local_db->table('product_locations')->where('product_id', $products_table_record->id)->where('location_id', $product_locations_record->location_id)->count();
                // dd($check_local_product_location_count);
                if ($check_local_product_location_count > 0) {
                    $local_db->table('product_locations')->updateOrInsert(['product_id' => $products_table_record->id, 'location_id' => $product_locations_record->location_id]);
                } else {
                    $local_db->table('product_locations')->insert((array)$product_locations_record);
                }
            } catch (Exception $e) {
                DB::rollBack();
                return $e;
            }
            // Get Record From product_variations
            $product_variation_record = $live_db->table('product_variations')->where('product_id', $products_table_record->id)->first();
            // dd($product_variation_record);
            if ($product_variation_record) {
                try {
                    // Insert Record into local DB product_variations table
                    $local_db->table('product_variations')->updateOrInsert(['id' => $product_variation_record->id], (array) $product_variation_record);
                } catch (Exception $e) {
                    DB::rollBack();
                    return $e;
                }
            }
            // Get Records from Variations Table
            $variation_table_records = $live_db->table('variations')->where('product_id', $products_table_record->id);
            $variation_table_records_count = $variation_table_records->count();
            // dd($variation_table_records_count, $products_table_record->id);
            if ($variation_table_records_count > 0) {
                $get_variation_table_records = $variation_table_records->get();
                // dd($get_variation_table_records);
                foreach ($get_variation_table_records as $variation_record) {
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
                            $local_db->table('variation_location_details')->updateOrInsert(['id' => $v_l_s_records->id], (array)$v_l_s_records);
                        }
                    } catch (Exception $e) {
                        DB::rollBack();
                        return $e;
                    }
                }
            }
            // dd([$products_table_record->id, $location_verfiy->id, $product_variation_record->id]);
            // variation location details
            # $v_l_s_records = $live_db->table('variation_location_details')
            # ->where('product_id', $products_table_record->id)
            # ->where('location_id', $location_verfiy->id)
            # ->where('product_variation_id', $product_variation_record->id)
            // ->where('variation_id', $live_db->table('variations')->columns('id')->where('product_'))
            # ->first();
            // $v_l_s_count->count();
            #if ($v_l_s_records) {
            # $local_db->table('variation_location_details')->insert((array)$v_l_s_records);
            #}


            // product img
            // $url_path = "https://techmonitor.ai/wp-content/uploads/sites/20/2016/06/";
            // $url_path = "http://demo.a1-pos.com/uploads/img/";
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

// Fetch Transaction based on type and location

$get_transaction_records = $live_db->table('transactions')
    ->where('business_id', $business_verfiy->id)
    ->where('location_id', $location_verfiy->id)
    ->whereIn('type', ['opening_stock'])
    ->get();
// dd($get_transaction_records);

foreach ($get_transaction_records as $transaction_records) {
    $transaction_records_without_ai_id = Arr::except((array)$transaction_records, ['ai_id']);
    // insert into local DB transaction table
    $local_db->table('transactions')->updateOrInsert(['id' => $transaction_records->id], $transaction_records_without_ai_id);
    //Get Live DB Purchae line records based on transaction id
    $purchase_line_record = $live_db->table('purchase_lines')->where('transaction_id', $transaction_records->id)->first();
    // insert into local DB purchase_lines table
    $local_db->table('purchase_lines')->updateOrInsert(['id' => $purchase_line_record->id], (array)$purchase_line_record);
}
