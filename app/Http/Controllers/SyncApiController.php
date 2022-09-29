<?php

namespace App\Http\Controllers;

use App\BusinessLocation;
use App\Business;
use App\Utils\ModuleUtil;
use App\Utils\ProductUtil;
use App\Utils\SyncUtil;
use Exception;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
// use Symfony\Component\HttpFoundation\Session\Session;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Session;


// use Session;


class SyncApiController extends Controller
{
    /**
     * All Utils instance.
     *
     */
    protected $syncUtil;
    
    public function __construct(SyncUtil $syncUtilty){
        $this->syncUtil = $syncUtilty;
    }

    public function prd($response)
    {
        echo "<pre>";
        print_r($response);
        die;
    }
    // 'headers' => [
    //     'Content-Type' => 'application/json',
    // 'Authorization' =>
    // 'Bearer ' .
    //     $token
    // ],

    public function productSync(){
        
        $live_server_path = "http://offlinesync.crossdevlogix.com/public/connector/api/";
        
        $business_verfiy = DB::table('business')->first();
        $location_verfiy = DB::table('business_locations')->first();

        $business_id = $business_verfiy->id;
        $location_id = $location_verfiy->id;
        $business_pin = $business_verfiy->secret_key;

        // Product Check 

        $http = new Client([
            'base_uri' => $live_server_path,
            'headers' => [
                'Content-Type' => 'application/json',
            ]
        ]);

        $products = DB::table('products')->where('sync_status' , 0);
        
        
        $product_data = $this->syncUtil->productsForSync($business_id, $location_id);
            $request = $http->post('recieve-offline-products', [
                'json' => ['data'=>$product_data]
            ]);
            if($request->getStatusCode() == 200){
                $response = json_decode($request->getBody());
                if($response->success == 1){
                    $this->syncUtil->changeProductStatusOnSuccess($product_data);
                }    
            }

    }

    public function businessRegValidate(request $request)
    {
        $business_pin = $request->only('business_pin');
        $location_pin = $request->only('location_pin');
        $live_server_path = "http://offlinesync.crossdevlogix.com/public/connector/api/";
        // $live_server_path = "https://syncres.a1-pos.com/connector/api/";

        $token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImQzODE0MjUyOWE5MTg5MGM0MGUwYjIxZjcwZDM3MGI5OGM3N2ZkNTk4NzdlOWM4YTM2Y2RkNTA0NjY3MjdhNzRiZGIzMmMxYzYxZGRmZjRmIn0.eyJhdWQiOiIxIiwianRpIjoiZDM4MTQyNTI5YTkxODkwYzQwZTBiMjFmNzBkMzcwYjk4Yzc3ZmQ1OTg3N2U5YzhhMzZjZGQ1MDQ2NjcyN2E3NGJkYjMyYzFjNjFkZGZmNGYiLCJpYXQiOjE2NDg2NDA4NzgsIm5iZiI6MTY0ODY0MDg3OCwiZXhwIjoxNjgwMTc2ODc4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.FbIRHEFyoabbCrQgaozki1put0bnW9W9VhFPH53-3nF8GSmVndo00FeguVXmZA5DEvMXUY5EXwXLHh9X3DpRFy-XinVVHXZVn5iIAYYbfujhHw9l3-49IWbYHmchnNrhNUgjLPwvgz7UjWyLjRgzWsIKupIO1eZVzAQA_o3JtTJRpJl17JgzsUyiib2ttHUD2pBvxmyGiILdNmOHqJ3CK4XOllpQTtDX40JYKseRrDdgm6N5xM_WrnDJ-rFvfoCLZTwgLSI29piG5yf1stfyQV6_d4Ob5BeFMe4Y2mIsAORbvRwS5mmB4ljYfOTRVqgNOHuBJAreFl2xrrzegTDdsjaubpMWaX7Wtz0sH5fgttDHsYlkkrMUDgIwK0h5RuHK84crDt0ggDAOIwlE2XIsWOQL4d8vuSbFXAk8s8h149Nzie3ln9VZpKxbG4PlQylltj6sJC6iOObNMETxQyl1Sj_EJgOW03PtPybz7vCxoHlDCVXzm1MhN9Q2KsOdgxG2nuYJbII49MqUGSJBWJMpn_r1tZub9chTWNDm0ghTCT_7DmJ3S59JbaFwUn9HYbYi1UlZ3-IgJwLK_ZNGhSqM77H_ju05hPZnXgdRde8zGOMObaGM5HJmNgv-8KFqsNLe84kJOTWOeptLxV5jFWBYL4c6z4_3PhazENSAA43wT1I';

        $http = new Client([
            'base_uri' => $live_server_path,
            'headers' => [
                'Content-Type' => 'application/json',
            ]
        ]);

        try {
            // DB::beginTransaction();
            $request = $http->get('business-verify', [
                'query' => [
                    'business_pin' => $business_pin
                ]
            ]);
            // Get Business
            if ($request->getStatusCode() == 200) {
                $response = json_decode($request->getBody());

                if (isset($response->error)) {
                    // dd([$response, 1]);
                    DB::rollBack();
                    $output = __("messages.something_went_wrong");
                    return redirect()->back()->with('error', $output);
                }
                $business_details = $response->data;
                if ($business_details->weighing_scale_setting == null) {
                    $business_details->weighing_scale_setting = "";
                }

                DB::table('business')->updateOrInsert(['id' => $response->data->id],  (array)$response->data);

                $request = $http->get('owner-id/' . $response->data->owner_id, [
                    'query' => [
                        'business_id' => $response->data->id
                    ]
                ]);

                if ($request->getStatusCode() == 200) {
                    $response = json_decode($request->getBody());

                    if (isset($response->error)) {
                        DB::rollBack();
                        $output = __("messages.something_went_wrong");
                        return redirect()->back()->with('error', $output);
                    }

                    DB::table('users')->updateOrInsert(['id' => $response->id],  (array)$response);
                    // $this->prd($response->id);
                } else {
                    DB::rollBack();
                    $output = __("messages.something_went_wrong");
                    return redirect()->back()->with('error', $output);
                }
            } else {
                dd([json_decode($request->getBody()), 4]);
                $output = __("messages.something_went_wrong");
                return redirect()->back()->with('error', $output);
            }

            $business = Business::where('secret_key', $business_pin)->select('id')->firstOrFail();

            // Invoices
            $invoice_tables = ['invoice_schemes', 'invoice_layouts'];

            foreach ($invoice_tables as $invoice_tab) {
                $query = ['query' => [
                    'business_id' => $business->id
                ]];
                switch ($invoice_tab) {
                    case 'invoice_schemes':
                        $request = $http->get('invoice-schemes', $query);
                        break;

                    case 'invoice_layouts':
                        $request = $http->get('invoice-layouts', $query);
                        break;

                    default:
                        # code...
                        break;
                }

                if ($request->getStatusCode() == 200) {
                    $response = json_decode($request->getBody());

                    if (isset($response->error)) {
                        // dd([$response, 5]);

                        $output = __("messages.something_went_wrong");
                        return redirect()->back()->with('error', $output);
                    }

                    foreach ($response->data as $invoice) {
                        DB::table($invoice_tab)->updateOrInsert(['id' => $invoice->id], (array) $invoice);
                    }
                } else {
                    // dd([$response, 6]);
                    DB::rollBack();
                    $output = __("messages.something_went_wrong");
                    return redirect()->back()->with('error', $output);
                }
            }

            // Get Business Locations
            $request = $http->get(
                'business-location-verify',
                [
                    'query' => [
                        'business_id' => $business->id,
                        'business_pin' => $business_pin,
                        'location_pin' =>  $location_pin
                    ]
                ]
            );
            if ($request->getStatusCode() == 200) {
                $response = json_decode($request->getBody());

                if (isset($response->error)) {
                    // dd([$response, 7]);
                    DB::rollBack();
                    $output = __("messages.something_went_wrong");
                    return redirect()->back()->with('error', $output);
                }

                DB::table('business_locations')->updateOrInsert(['id' => $response->data->id],  (array)$response->data);

                $location_id = DB::table('business_locations')->select('id')->where('id', $response->data->id)->first();
                $location = 'location.' . $location_id->id;
                // get location permission
                $request = $http->get('location-permission', [
                    'query' => [
                        'location_permission' => $location
                    ]
                ]);
                if ($request->getStatusCode() == 200) {
                    $response = json_decode($request->getBody());

                    if (isset($response->error)) {
                        // dd([$response, 8]);
                        DB::rollBack();
                        $output = __("messages.something_went_wrong");
                        return redirect()->back()->with('error', $output);
                    }
                    DB::table('permissions')->updateOrInsert(['id' => $response->id, 'name' => $response->name], (array) $response);
                } else {
                    // dd([$response, 9]);
                    DB::rollBack();
                    $output = __("messages.something_went_wrong");
                    return redirect()->back()->with('error', $output);
                }

                // $this->prd($location_id);

            } else {
                // dd([$response, 10]);
                DB::rollBack();
                $output = __("messages.something_went_wrong");
                return redirect()->back()->with('error', $output);
            }

            // get default locations
            $request = $http->get('default-permissions');
            if ($request->getStatusCode() == 200) {
                $response = json_decode($request->getBody());

                if (isset($response->error)) {
                    // dd([$response, 11]);
                    DB::rollBack();
                    $output = __("messages.something_went_wrong");
                    return redirect()->back()->with('error', $output);
                }
                foreach ($response->data as $permission) {
                    DB::table('permissions')->updateOrInsert(['id' => $permission->id, 'name' => $permission->name], (array) $permission);
                }
            } else {
                // dd([$response, 12]);
                DB::rollBack();
                $output = __("messages.something_went_wrong");
                return redirect()->back()->with('error', $output);
            }

            // users users_has_permissions permissions
            $request = $request = $http->get('list-users', [
                'query' => [
                    'business_id' => $business->id,
                    'location_id' => $location_id->id
                ]
            ]);

            if ($request->getStatusCode() == 200) {
                $response = json_decode($request->getBody());

                if (isset($response->error)) {
                    // dd([$response, 12]);
                    DB::rollBack();
                    $output = __("messages.something_went_wrong");
                    return redirect()->back()->with('error', $output);
                }

                // get users 
                foreach ($response->data as $user_x_permission) {

                    $user_without_permission = Arr::except((array)$user_x_permission, "model_has_permissions");
                    DB::table('users')->updateOrInsert(['id' => $user_without_permission['id']], $user_without_permission);

                    // permissions and model_has_permissions
                    foreach ($user_x_permission->model_has_permissions as $mhp) {
                        $mph_without_permission =  Arr::except((array)$mhp, "permissions");

                        // permissions
                        DB::table('permissions')->updateOrInsert(['id' => $mhp->permissions->id], (array)$mhp->permissions);

                        DB::table('model_has_permissions')->updateOrInsert([
                            'permission_id' => $mhp->permission_id,
                            'model_id' => $user_x_permission->id,
                            'model_type' => $mhp->model_type
                        ], $mph_without_permission);
                    }
                }
            } else {
                // dd([$response, 13]);
                DB::rollBack();
                $output = __("messages.something_went_wrong");
                return redirect()->back()->with('error', $output);
            }

            // roles and model has roles
            $request = $request = $http->get('list-roles', [
                'query' => [
                    'business_id' => $business->id,
                ]
            ]);

            if ($request->getStatusCode() == 200) {
                $response = json_decode($request->getBody());

                if (isset($response->error)) {
                    // dd([$response, 14]);
                    DB::rollBack();
                    $output = __("messages.something_went_wrong");
                    return redirect()->back()->with('error', $output);
                }

                // get roels 
                // mhr = model_has_roles
                // rhp = role_has_permissions
                foreach ($response as $role) {

                    $role_without_mhr_rhp = Arr::except((array)$role, ["role_has_permissions", "model_has_roles"]);
                    DB::table('roles')->updateOrInsert(['id' => $role->id], $role_without_mhr_rhp);

                    // model_has_roles
                    foreach ($role->model_has_roles as $mhr) {

                        DB::table('model_has_roles')->updateOrInsert([
                            'role_id' => $mhr->role_id,
                            'model_id' => $mhr->model_id,
                            'model_type' => $mhr->model_type
                        ], (array) $mhr);
                    }
                    // role_has_permissions
                    foreach ($role->role_has_permissions as $mhp) {
                        // $this->prd($mhp);
                        if (is_null(DB::table('permissions')->where('id', $mhp->permission_id)->first())) {
                            // $this->prd($mhp->permissions);
                            DB::table('permissions')->insert((array)$mhp->permissions);
                        }
                        $rhp_without_permissions = Arr::except((array)$mhp, ["permissions"]);
                        DB::table('role_has_permissions')->updateOrInsert(['role_id' => $mhp->role_id, 'permission_id' => $mhp->permission_id],  $rhp_without_permissions);
                    }
                }
            } else {
                // dd([$response, 15]);
                DB::rollBack();
                $output = __("messages.something_went_wrong");
                return redirect()->back()->with('error', $output);
            }
            DB::commit();
            return redirect('login')->with('success', 'Your system is ready! <br> Please Login and get started');
        } catch (Exception $e) {
            DB::rollBack();
            $output = __("messages.something_went_wrong");
            // dd($e);
            return redirect()->back()->with('error', $output);
        }
    }


    public function getLiveProductsData()
    {
        // $live_server_path = "https://syncres.a1-pos.com/connector/api/";
        $live_server_path = "http://offlinesync.crossdevlogix.com/public/connector/api/";
        $local_db = DB::connection('mysql');
        $business_verfiy = $local_db->table('business')->first();
        $location_verfiy = $local_db->table('business_locations')->first();

        $business_id = $business_verfiy->id;
        $location_id = $location_verfiy->id;
        $business_pin = $business_verfiy->secret_key;

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
                $http = new Client([
                    'base_uri' => $live_server_path,
                    'headers' => [
                        'Content-Type' => 'application/json',
                    ]
                ]);

                $request = $http->get('business-verify', [
                    'query' => [
                        'business_pin' => $business_pin
                    ]
                ]);
                // Get Business
                if ($request->getStatusCode() == 200) {
                    $response = json_decode($request->getBody());

                    if (isset($response->error)) {
                        // dd([$response, 1]);
                        DB::rollBack();
                        $output = __("messages.something_went_wrong");
                        return redirect()->back()->with('error', $output);
                    }

                    DB::table('business')->updateOrInsert(['id' => $response->data->id],  (array)$response->data);
                } else {
                    // dd([json_decode($request->getBody()), 2]);
                    DB::rollBack();
                    $output = __("messages.something_went_wrong");
                    return redirect()->back()->with('error', $output);
                }

                // get CUB tables dependent on business id
                $cat_unit_brands_table = [
                    'invoice_schemes',
                    'invoice_layouts',
                    'categories',
                    'units',
                    'brands',
                    'warranties',
                    'expense_categories',
                    'contacts',
                    'types_of_services',
                    'tax_rates', 'notification_templates'
                ];

                foreach ($cat_unit_brands_table as $cub_table) {
                    $request = $http->get('list-' . $cub_table, [
                        'query' => [
                            'business_id' => $business_id
                        ]
                    ]);
                    if ($request->getStatusCode() == 200) {
                        $response = json_decode($request->getBody());

                        if (isset($response->error)) {
                            // dd([$response, 11]);
                            DB::rollBack();
                            $output = __("messages.something_went_wrong");
                            return redirect()->back()->with('error', $output);
                        } else {
                            foreach ($response->data as $table_record) {
                                // $this->prd($table_record->id);
                                DB::table($cub_table)->updateOrInsert(['id' => $table_record->id], (array) $table_record);
                            }
                        }
                    } else {
                        // dd([json_decode($request->getBody()), 12]);
                        DB::rollBack();
                        $output = __("messages.something_went_wrong");
                        return redirect()->back()->with('error', $output);
                    }
                }



                $request = $http->get('list-variation-templates', [
                    'query' => [
                        'business_id' => $business_id
                    ]
                ]);

                if ($request->getStatusCode() == 200) {
                    $response = json_decode($request->getBody());

                    if (isset($response->error)) {
                        // dd([$response, 11]);
                        DB::rollBack();
                        $output = __("messages.something_went_wrong");
                        return redirect()->back()->with('error', $output);
                    }
                    foreach ($response->data as $variation_template) {

                        $variation_template_without = Arr::except((array) $variation_template, ['variation_value_templates']);

                        DB::table('variation_templates')->updateOrInsert(['id' => $variation_template->id], $variation_template_without);
                        foreach ($variation_template->variation_value_templates as $var_val_temp) {
                            DB::table('variation_value_templates')->updateOrInsert(['id' => $var_val_temp->id], (array) $var_val_temp);
                        }
                        // $product->product_variations;
                    }
                } else {
                    // dd([json_decode($request->getBody()), 12]);
                    DB::rollBack();
                    $output = __("messages.something_went_wrong");
                    return redirect()->back()->with('error', $output);
                }



                // $request = $http->get('list-products', [
                //     'query' => [
                //         'business_id' => $business_id,
                //         'location_id' => $location_id,
                //         'purchase_lines' => 1
                //     ]
                // ]);

                // if ($request->getStatusCode() == 200) {
                //     $response = json_decode($request->getBody());

                //     if (isset($response->error)) {
                //         // dd([$response, 11]);
                //         DB::rollBack();
                //         $output = __("messages.something_went_wrong");
                //         return redirect()->back()->with('error', $output);
                //     }
                //     foreach ($response->data as $product) {

                //         $product_without = Arr::except((array) $product, ['product_variations', 'image_url', 'product_locations']);
                //         DB::table('products')->updateOrInsert(['id' => $product->id], $product_without);

                //         // product var
                //         $product->product_variations;
                //         foreach ($product->product_variations as $product_var) {
                //             $product_var_without = Arr::except((array) $product_var, ['variations']);

                //             DB::table('product_variations')->updateOrInsert(['id' => $product_var->id], (array) $product_var_without);

                //             foreach ($product_var->variations as $variation) {

                //                 $variation_without = Arr::except((array) $variation, ['variation_location_details', 'media', 'discounts']);

                //                 DB::table('variations')->updateOrInsert(['id' => $variation->id], $variation_without);

                //                 $variation_location_details  = $variation->variation_location_details;

                //                 // dd($variation_location_details);

                //                 foreach ($variation_location_details as $vld) {
                //                     $variation_location_details_without = Arr::except((array) $vld, ['purchase_lines']);
                //                     DB::table('variation_location_details')->updateOrInsert(
                //                         ['id' => $vld->id],
                //                         (array) $variation_location_details_without
                //                     );
                //                     // dd($vld);

                //                     $purchase_lines = $vld->purchase_lines;
                //                     foreach ($purchase_lines as $pl) {

                //                         // get transaction record
                //                         $request = $http->get('purchase-transaction', [
                //                             'query' => [
                //                                 'transaction_id' => $pl->transaction_id
                //                             ]
                //                         ]);

                //                         if ($request->getStatusCode() == 200) {
                //                             $response = json_decode($request->getBody());

                //                             if (isset($response->error)) {
                //                                 // dd([$response, 11]);
                //                                 DB::rollBack();
                //                                 $output = __("messages.something_went_wrong");
                //                                 return redirect()->back()->with('error', $output);
                //                             }
                //                             // $this->prd($response->id);
                //                             $transaction_without = Arr::except((array) $response, ['ai_id']);
                //                             DB::table('transactions')->updateOrInsert(['id' => $response->id], (array) $transaction_without);
                //                         } else {
                //                             dd([$response, 11]);
                //                             $output = __("messages.something_went_wrong");
                //                             return redirect()->back()->with('error', $output);
                //                         }

                //                         DB::table('purchase_lines')->updateOrInsert(['id' => $pl->id], (array) $pl);
                //                     }
                //                 }
                //             }
                //         }

                //         foreach ($product->product_locations as $product_location) {
                //             $pl = $product_location->pivot;
                //             DB::table('product_locations')->updateOrInsert(['product_id' => $pl->product_id, 'location_id' => $pl->location_id]);
                //         }

                //         // GET PRODUCT IMAGE

                //         $url_path = $product->image_url;
                //         $name = substr($url_path, strrpos($url_path, '/') + 1);


                //         if (($data = @file_get_contents($url_path)) === false) {
                //             $error = error_get_last();
                //             $err[] = $url_path;
                //         } else {
                //             $err[] = $url_path;
                //             if ($contents = file_get_contents($url_path)) {
                //                 Storage::put('img/' . $name, $contents);
                //             } else {
                //                 $err[] = "No Data";
                //             }
                //         }

                //         //dd($product->product_locations[0]->pivot);
                //     }
                // } else {
                //     // dd([json_decode($request->getBody()), 12]);
                //     DB::rollBack();
                //     $output = __("messages.something_went_wrong");
                //     return redirect()->back()->with('error', $output);
                // }
                // resturant tables

                $request = $http->get('table', [
                    'query' => [
                        'business_id' => $business_id,
                        'location_id' => $location_id
                    ]
                ]);
                // Get tables
                if ($request->getStatusCode() == 200) {
                    $response = json_decode($request->getBody());

                    if (isset($response->error)) {
                        // dd([$response, 1]);
                        DB::rollBack();
                        $output = __("messages.something_went_wrong");
                        return redirect()->back()->with('error', $output);
                    }

                    foreach ($response->data as $res_table) {
                        DB::table('res_tables')->updateOrInsert(['id' => $res_table->id],  (array)$res_table);
                    }
                } else {
                    // dd([json_decode($request->getBody()), 2]);
                    DB::rollBack();
                    $output = __("messages.something_went_wrong");
                    return redirect()->back()->with('error', $output);
                }

        // Modifiers
                // $request = $http->get('list-modifiers', [
                //     'query' => [
                //         'business_id' => $business_id,
                //         'location_id' => $location_id
                //     ]
                // ]);
                // if ($request->getStatusCode() == 200) {
                //     $response = json_decode($request->getBody());

                //     if (isset($response->error)) {
                //         // dd([$response, 11]);
                //         DB::rollBack();
                //         $output = __("messages.something_went_wrong");
                //         return redirect()->back()->with('error', $output);
                //     }
                //     foreach ($response->data as $modifier) {
                //         $modifier_without = Arr::except((array) $modifier, ['product_variations', 'image_url', 'modifier_products']);

                //         DB::table('products')->updateOrInsert(['id' => $modifier->id],  $modifier_without);

                //         // $this->prd($modifier);
                //         $mod_product_variations = $modifier->product_variations;
                //         foreach ($mod_product_variations as $mod_product_var) {

                //             $mod_product_var_without = Arr::except((array) $mod_product_var, ['variations']);

                //             DB::table('product_variations')->updateOrInsert(['id' => $mod_product_var->id], (array) $mod_product_var_without);

                //             foreach ($mod_product_var->variations as $mod_variation) {
                //                 DB::table('variations')->updateOrInsert(['id' => $mod_variation->id], (array)$mod_variation);
                //             }
                //         }

                //         $modifier_products = $modifier->modifier_products;

                //         foreach ($modifier_products as $mod_product) {
                //             $res_product_modifier_sets = $mod_product->pivot;
                //             DB::table('res_product_modifier_sets')->updateOrInsert([
                //                 'modifier_set_id' => $res_product_modifier_sets->modifier_set_id,
                //                 'product_id' => $res_product_modifier_sets->product_id
                //             ], (array) $res_product_modifier_sets);
                //         }
                //     }
                // } else {
                //     // dd(json_decode($request->getBody()));
                //     DB::rollBack();
                // }


                DB::commit();
                Session::flash('product-message', 'Data Received Successfully');
                return redirect()->back();

                // dd(json_decode($request->getBody()));
            } catch (Exception $e) {


                DB::rollBack();
                Session::flash('product-error', 'Something Went Wrong, Please Try Again.');
                // return dd($e);
                return redirect()->back();
            }
        }
    }




    public function syncSale()
    {

        if ((request()->session()->has('user')) == false || auth()->user() == null) {
            Session::flash('sales-sync-error', 'Please login');
            return redirect('/login');
        }

        $business_id = request()->session()->get('user.business_id');
        $local_db = DB::connection('mysql');

        $check_cash_status_count = $local_db->table('cash_registers')->where('status', 'open')->count();

        if ($check_cash_status_count > 0) {
            Session::flash('sales-sync-error', 'Please Close Cash Register.');
            return redirect()->back();
        } else {

            try {
                DB::beginTransaction();

                $this->productSync();

                // $url = "https://syncres.a1-pos.com/api/";
                $url = "http://offlinesync.crossdevlogix.com/public/api/";

                $http = new Client([
                    'base_uri' => $url,
                    'headers' => [
                        'Content-Type' => 'application/json', 'Accept' => 'application/json'
                    ]
                ]);

                $request = $http->get('get-suppliers', [
                    'query' => ['business_id' => $business_id]
                ]);

                if ($request->getStatusCode() == 200) {

                    $suppliers = json_decode($request->getBody());
                    $get_suppliers = (array) $suppliers;

                    if (isset($get_suppliers['suppliers'])) {
                        foreach ($get_suppliers['suppliers'] as $supplier) {
                            $local_db->table('contacts')->updateOrInsert(['id' => $supplier->id], (array) $supplier);
                        }
                    }
                } else {
                    DB::rollBack();
                    // dd($request->getStatusCode());
                    DB::rollBack();
                    dd("K");
                    Session::flash('sales-sync-error', 'Something Went Wrong');
                    return redirect()->back();
                }
                // dd("K");
                // $get_vld_records = $local_db->table('variation_location_details')->get();

                // foreach ($get_vld_records as $vld_record) {
                //     $request = $http->post('get-vld-records', [
                //         'json' => [
                //             $vld_record
                //         ]
                //     ]);
                //     $live_qty_available = json_decode($request->getBody());

                //     $sold_qty_count = $local_db->table('transaction_sell_lines')
                //         ->where('sync_status', 0)
                //         ->where('product_id', $vld_record->product_id)
                //         ->where('variation_id', $vld_record->variation_id)
                //         ->sum('quantity');

                //     $qty_left = $live_qty_available - $sold_qty_count;
                //     $sale_table_record_without_qty = Arr::except((array)$vld_record, ['qty_available']);
                //     $qty_to_update = $qty_left;
                //     $v_l_d_record = $sale_table_record_without_qty + ['qty_available' => $qty_to_update];

                //     $request = $http->post('update-vld-records', [
                //         'json' => [
                //             $v_l_d_record
                //         ]
                //     ]);
                //     $response = $request->getStatusCode();

                //     if ($response == 200) {
                //         // update local table
                //         $local_db->table('variation_location_details')->updateOrInsert(
                //             ['id' => $v_l_d_record['id']],
                //             $v_l_d_record
                //         );
                //     } else {
                //         // dd("Something Went Wrong");
                //         DB::rollBack();
                //         // dd($request->getStatusCode());
                //         Session::flash('sales-sync-error', 'Something Went Wrong');
                //         return redirect()->back();
                //     }

                //     // local purchase lines records to sync
                //     $p_line_records = $local_db->table('purchase_lines')
                //         ->where('product_id', $vld_record->product_id)
                //         ->where('variation_id', $vld_record->variation_id)
                //         ->get();

                //     foreach ($p_line_records as $p_line) {

                //         $request = $http->post('update-purchase-line-vld', [
                //             'json' => [
                //                 'p_line' => $p_line
                //             ]
                //         ]);
                //     }
                //     $response = $request->getStatusCode();

                //     // get new purchase line records if any in case of stock update                 
                //     if ($response == 200) {
                //         $request = $http->get('get-latest-plines', [
                //             'query' => [
                //                 'product_id' => $vld_record->product_id,
                //                 'variation_id' => $vld_record->variation_id
                //             ]
                //         ]);
                //         $response = $request->getStatusCode();

                //         if ($response == 200) {

                //             $pline_records = json_decode($request->getBody());

                //             foreach ($pline_records as $p_line) {

                //                 // insert new rcords in pline
                //                 $local_db->table('purchase_lines')
                //                     ->updateOrInsert(['id' => $p_line->id], (array) $p_line);

                //                 $request = $http->get('transactions-records-4-pline', [
                //                     'query' => [
                //                         'transaction_id' => $p_line->transaction_id
                //                     ]
                //                 ]);

                //                 if ($request->getStatusCode() == 200) {

                //                     $get_transaction_record_4_p_line = json_decode($request->getBody());

                //                     $local_db->table('transactions')->updateOrInsert(
                //                         ['id' => $get_transaction_record_4_p_line->id],
                //                         (array)  $get_transaction_record_4_p_line
                //                     );
                //                 } else {
                //                     // dd($request->getStatusCode());
                //                     DB::rollBack();
                //                     // dd($request->getStatusCode());
                //                     Session::flash('sales-sync-error', 'Something Went Wrong');
                //                     return redirect()->back();
                //                 }
                //             }
                //         } else {
                //             DB::rollBack();
                //             // dd($request->getStatusCode());
                //             Session::flash('sales-sync-error', 'Something Went Wrong');
                //             return redirect()->back();
                //         }
                //     } else {
                //         DB::rollBack();
                //         // dd($request->getStatusCode());
                //         Session::flash('sales-sync-error', 'Something Went Wrong');
                //         return redirect()->back();
                //     }
                // }

                $salesTables =  [
                    'contacts', 
                    'transactions', 
                    'transaction_payments', 
                    'transaction_sell_lines', 
                    'cash_registers', 
                    'cash_register_transactions'
                ];

                foreach ($salesTables as $salesTable) {

                    $get_sale_table_records = $local_db->table($salesTable)
                        ->where('sync_status', 0)->get();

                    if (
                        $local_db->table($salesTable)
                        ->where('sync_status', 0)->count() > 0
                    ) {

                        $request = $http->post('sale-tables', [
                            'json' => [
                                $salesTable => $get_sale_table_records
                            ]
                        ]);

                        $response = json_decode($request->getBody());

                        if ($response->msg == 'success') {
                            foreach ($get_sale_table_records as $data) {
                                $local_db->table($salesTable)
                                    ->where('id', $data->id)
                                    ->update(['sync_status' => 1]);
                            }
                        } else {
                            DB::rollBack();
                            // dd($request->getStatusCode());
                            Session::flash('sales-sync-error', 'Something Went Wrong');
                            return redirect()->back();
                        }
                    }
                }
                // NEW CODE ADDED
                $stock_1_tables = ['transaction_sell_lines_purchase_lines', 'purchase_lines', 'invoice_schemes'];

                foreach ($stock_1_tables as $table) {
                    $get_sale_table_records = $local_db->table($table)->get();

                    $request = $http->post('sale-stock-tables', [
                        'json' => [
                            $table => $get_sale_table_records
                        ]
                    ]);
                    $response = json_decode($request->getBody());

                    if (!$response->msg == 'success') {
                        DB::rollBack();
                        // dd($response);
                        DB::rollBack();
                        // dd($request->getStatusCode());
                        Session::flash('sales-sync-error', 'Something Went Wrong');
                        return redirect()->back();
                    }
                }


                if (DB::table('delete_sales')->where('sync_status', 0)->count() > 0) {
                    $sale_ids = DB::table('delete_sales')->where('sync_status', 0)->get()->pluck('transaction_id');

                    $request = $http->get('delete-sale', [
                        'json' => [
                            'transaction_id' => $sale_ids,
                            'business_id' => $business_id
                        ]
                    ]);

                    $response = json_decode($request->getBody());
                    if ($request->getStatusCode() == 200) {


                        if (isset($response->success) && $response->success == "true") {
                            DB::table('delete_sales')->whereIn('transaction_id', $sale_ids)->update(['sync_status' => 1]);
                        } else {
                            throw new Exception("\DELETE SALE ERROR");
                        }
                    } else {
                        DB::rollBack();
                        // dd("error");
                        Session::flash('sales-sync-error', 'Something Went Wrong');
                        return redirect()->back();
                    }
                }

                DB::commit();
                Session::flash('sales-sync-success', 'Sales Synced Successfully');
                return redirect()->back();
            } catch (Exception $e) {
                DB::rollBack();
                dd($e);
                Session::flash('sales-sync-error', 'Something Went Wrong');
                return redirect()->back();
            }
        }
    }

    function test()
    {

        $url = "https://syncres.a1-pos.com/connector/api/";
        $http = new Client([
            'base_uri' => $url,
            'headers' => [
                'Content-Type' => 'application/json', 'Accept' => 'application/json',
                'Authorization' => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImE3NWI0NjQ1OGRlYTlhZDkxNzVmNzdmY2IwZGY5ZTE3MGY0MjhmZTljZjhmZGIwMWFlZjM4ZGExNDMzN2NiOTMwYjFjYWRhYTdkODE0OWIwIn0.eyJhdWQiOiIxIiwianRpIjoiYTc1YjQ2NDU4ZGVhOWFkOTE3NWY3N2ZjYjBkZjllMTcwZjQyOGZlOWNmOGZkYjAxYWVmMzhkYTE0MzM3Y2I5MzBiMWNhZGFhN2Q4MTQ5YjAiLCJpYXQiOjE2NDk1ODc1ODYsIm5iZiI6MTY0OTU4NzU4NiwiZXhwIjoxNjgxMTIzNTg2LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.Xox8yGlD_65Us49PkN9eqTb_jX64WtE9hWmXIiD3-UG6bwcfHq-pwpTaMwsogFij6S610-iBy9NS-wzTFbR5qO88MeVGFaD4q2dyMqaoaYlyIf94uUsQjh6Dncyojgt4GaYqPyRA-muyAsBJXYoqe2HJpuAzs4q6mo9sBZFRFPf79n1Z13I5fvAOmVT5ygiy2L160I81odhdPLqH1UE0q8aZIWjwiuRvnyeJ-O7v1QY8W3X7sWfis_kbViemm-1xIf6h3AC9aiVhb2Ijll8VlJfE097QrZZLvpbNFZTR2yNM_vTrXAqvvyhfVgKnZHTiSa3VK_87VtDMTAa0aFDx3yi3j5Ac1ANAuz6vhFWB0RS_t7AS09W3TznCIpVkCAPcsPvdPjOQC7JtoTiLo0jrkBnL1mZ__85-f7TgguvR7LQnmnmg6SNaL3RBM71PnWapTK0gcwYuOlwxdYM5SA_4yUaAYquBd3kcp_oFVTBzTh87tfSCM_yyYcwU5Gwi9NKqHqd5ZxLFpI7-lrrD30jVYb6V0kTmImRCmB6qo3KUkuYERoxWVglwBriA78jM80d-q4AUx2m-g7WnJBz2BEBZ52N5STVN3nDk5vOndw8ngIg-gNKkAFpM_R4WXdlpHmZqQVDnODHVER6IxPtjLpEbqiXEx9gycfJJf327NMCEwWg'
            ]
        ]);

        $q = '
            
            
                {
                    "location_id": 1,
                    "contact_id": 1,
                    "transaction_date": "2020-07-22 15:48:29",
                    "invoice_no": "0032",
                    "status": "final",
                    "is_quotation": false,
                    "tax_rate_id": null,
                    "discount_amount": 10,
                    "discount_type": "fixed",
                    "sale_note": "recusandae",
                    "staff_note": "nulla",
                    
                    "shipping_charges": 10,
                    "packing_charge": 10,
                    "exchange_rate": 1,
                    
                    
                    
                    "table_id": null,
                    "service_staff_id": null,
                    "change_return": 0,
                    "products": [
                        {
                            "product_id": 1,
                            "variation_id": 1,
                            "quantity": 1,
                            "unit_price": 399,
                            "tax_rate_id": 0,
                            "discount_amount": 0,
                            "discount_type": "percentage",
                            "sub_unit_id": null,
                            "note": "consectetur"
                        }
                    ],
                    "payments": [
                        {
                            "amount": 453.13,
                            "method": "cash",
                            "account_id": 2,
                            "card_number": "rerum",
                            "card_holder_name": "molestias",
                            "card_transaction_number": "est",
                            "card_type": "explicabo",
                            "card_month": "earum",
                            "card_year": "in",
                            "card_security": "corrupti",
                            "transaction_no_1": "provident",
                            "transaction_no_2": "veritatis",
                            "transaction_no_3": "dolore",
                            "bank_account_number": "suscipit",
                            "note": "doloremque",
                            "cheque_number": "voluptate"
                        }
                    ]
                }
                
        ';

        $x = json_decode($q, true);
        // $this->prd($x);
        $arr = $x;
        // dd($arr);
        $request = $http->post(
            'sell',
            [
                'form_params' => [

                    'sells' => [$x]
                ],
            ]

        );
        $response = json_decode($request->getBody());
        dd($response);
        return $response;
    }
}
