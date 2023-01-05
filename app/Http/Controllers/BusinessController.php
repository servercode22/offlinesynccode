<?php

namespace App\Http\Controllers;

use App\Business;
use App\Currency;
use App\Notifications\TestEmailNotification;
use App\System;
use App\TaxRate;
use App\Unit;
use App\User;
use App\Utils\BusinessUtil;
use App\Utils\ModuleUtil;
use App\Utils\RestaurantUtil;
use App\Utils\SyncUtil;
use Carbon\Carbon;
use DateTimeZone;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;


class BusinessController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | BusinessController
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new business/business as well as their
    | validation and creation.
    |
    */

    /**
     * All Utils instance.
     *
     */
    protected $businessUtil;
    protected $restaurantUtil;
    protected $moduleUtil;
    protected $mailDrivers;
    // protected $syncUtil;

    /**
     * Constructor
     *
     * @param ProductUtils $product
     * @return void
     */
    // , SyncUtil $syncUtil
    public function __construct(BusinessUtil $businessUtil, RestaurantUtil $restaurantUtil, ModuleUtil $moduleUtil)
    {
        $this->businessUtil = $businessUtil;
        $this->moduleUtil = $moduleUtil;
        // $this->$syncUtil = $syncUtil;

        $this->theme_colors = [
            'blue' => 'Blue',
            'black' => 'Black',
            'purple' => 'Purple',
            'green' => 'Green',
            'red' => 'Red',
            'yellow' => 'Yellow',
            'blue-light' => 'Blue Light',
            'black-light' => 'Black Light',
            'purple-light' => 'Purple Light',
            'green-light' => 'Green Light',
            'red-light' => 'Red Light',
        ];

        $this->mailDrivers = [
            'smtp' => 'SMTP',
            // 'sendmail' => 'Sendmail',
            // 'mailgun' => 'Mailgun',
            // 'mandrill' => 'Mandrill',
            // 'ses' => 'SES',
            // 'sparkpost' => 'Sparkpost'
        ];
    }

    /**
     * Shows registration form
     *
     * @return \Illuminate\Http\Response
     */
    public function getRegister()
    {

        if (!config('constants.allow_registration')) {
            return redirect('/');
        }

        $currencies = $this->businessUtil->allCurrencies();

        $timezone_list = $this->businessUtil->allTimeZones();

        $months = [];
        for ($i = 1; $i <= 12; $i++) {
            $months[$i] = __('business.months.' . $i);
        }

        $accounting_methods = $this->businessUtil->allAccountingMethods();
        $package_id = request()->package;

        $system_settings = System::getProperties(['superadmin_enable_register_tc', 'superadmin_register_tc'], true);

        return view('business.register', compact(
            'currencies',
            'timezone_list',
            'months',
            'accounting_methods',
            'package_id',
            'system_settings'
        ));
    }

    /**
     * Handles the registration of a new business and it's owner
     *
     * @return \Illuminate\Http\Response
     */
    public function postRegister(Request $request)
    {
        if (!config('constants.allow_registration')) {
            return redirect('/');
        }

        try {
            $validator = $request->validate(
                [
                    'name' => 'required|max:255',
                    'currency_id' => 'required|numeric',
                    'country' => 'required|max:255',
                    'state' => 'required|max:255',
                    'city' => 'required|max:255',
                    'zip_code' => 'required|max:255',
                    'landmark' => 'required|max:255',
                    'time_zone' => 'required|max:255',
                    'surname' => 'max:10',
                    'email' => 'sometimes|nullable|email|unique:users|max:255',
                    'first_name' => 'required|max:255',
                    'username' => 'required|min:4|max:255|unique:users',
                    'password' => 'required|min:4|max:255',
                    'fy_start_month' => 'required',
                    'accounting_method' => 'required',
                ],
                [
                    'name.required' => __('validation.required', ['attribute' => __('business.business_name')]),
                    'name.currency_id' => __('validation.required', ['attribute' => __('business.currency')]),
                    'country.required' => __('validation.required', ['attribute' => __('business.country')]),
                    'state.required' => __('validation.required', ['attribute' => __('business.state')]),
                    'city.required' => __('validation.required', ['attribute' => __('business.city')]),
                    'zip_code.required' => __('validation.required', ['attribute' => __('business.zip_code')]),
                    'landmark.required' => __('validation.required', ['attribute' => __('business.landmark')]),
                    'time_zone.required' => __('validation.required', ['attribute' => __('business.time_zone')]),
                    'email.email' => __('validation.email', ['attribute' => __('business.email')]),
                    'email.email' => __('validation.unique', ['attribute' => __('business.email')]),
                    'first_name.required' => __('validation.required', ['attribute' =>
                    __('business.first_name')]),
                    'username.required' => __('validation.required', ['attribute' => __('business.username')]),
                    'username.min' => __('validation.min', ['attribute' => __('business.username')]),
                    'password.required' => __('validation.required', ['attribute' => __('business.username')]),
                    'password.min' => __('validation.min', ['attribute' => __('business.username')]),
                    'fy_start_month.required' => __('validation.required', ['attribute' => __('business.fy_start_month')]),
                    'accounting_method.required' => __('validation.required', ['attribute' => __('business.accounting_method')]),
                ]
            );

            DB::beginTransaction();

            //Create owner.
            $owner_details = $request->only(['surname', 'first_name', 'last_name', 'username', 'email', 'password', 'language']);

            $owner_details['language'] = empty($owner_details['language']) ? config('app.locale') : $owner_details['language'];

            $user = User::create_user($owner_details);

            $business_details = $request->only(['name', 'start_date', 'currency_id', 'time_zone']);
            $business_details['fy_start_month'] = 1;

            $business_location = $request->only(['name', 'country', 'state', 'city', 'zip_code', 'landmark', 'website', 'mobile', 'alternate_number']);

            //Create the business
            $business_details['owner_id'] = $user->id;
            if (!empty($business_details['start_date'])) {
                $business_details['start_date'] = Carbon::createFromFormat(config('constants.default_date_format'), $business_details['start_date'])->toDateString();
            }

            //upload logo
            $logo_name = $this->businessUtil->uploadFile($request, 'business_logo', 'business_logos', 'image');
            if (!empty($logo_name)) {
                $business_details['logo'] = $logo_name;
            }

            //default enabled modules
            $business_details['enabled_modules'] = ['purchases', 'add_sale', 'pos_sale', 'stock_transfers', 'stock_adjustment', 'expenses'];

            $business = $this->businessUtil->createNewBusiness($business_details);

            //Update user with business id
            $user->business_id = $business->id;
            $user->save();

            $this->businessUtil->newBusinessDefaultResources($business->id, $user->id);
            $new_location = $this->businessUtil->addLocation($business->id, $business_location);

            //create new permission with the new location
            Permission::create(['name' => 'location.' . $new_location->id]);

            DB::commit();

            //Module function to be called after after business is created
            if (config('app.env') != 'demo') {
                $this->moduleUtil->getModuleData('after_business_created', ['business' => $business]);
            }

            //Process payment information if superadmin is installed & package information is present
            $is_installed_superadmin = $this->moduleUtil->isSuperadminInstalled();
            $package_id = $request->get('package_id', null);
            if ($is_installed_superadmin && !empty($package_id) && (config('app.env') != 'demo')) {
                $package = \Modules\Superadmin\Entities\Package::find($package_id);
                if (!empty($package)) {
                    Auth::login($user);
                    return redirect()->route('register-pay', ['package_id' => $package_id]);
                }
            }

            $output = [
                'success' => 1,
                'msg' => __('business.business_created_succesfully')
            ];

            return redirect('login')->with('status', $output);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());

            $output = [
                'success' => 0,
                'msg' => __('messages.something_went_wrong')
            ];

            return back()->with('status', $output)->withInput();
        }
    }
    /**
     * Handles the Sync Function For Business Location Startup
     *
     * @return string message
     */
    public function pinVerification(Request $request)
    {
        $live_db = DB::connection('mysql_2');
        $local_db = DB::connection('mysql');
        // $url_path = "http://demo.a1-pos.com/uploads/img/";


        if (!config('constants.allow_registration')) {
            return redirect('/');
        }
        $validator = $request->validate(
            [
                'business_pin' => 'required|max:255',
                'location_pin' => 'required|max:255',
            ],
        );

        $business_records_count = $live_db->table('business')->where('secret_key', $request->input('business_pin'))->count();

        $business_locations_records_count = $live_db->table('business_locations')->where('secret_key', $request->input('location_pin'))->count();
        if ($business_records_count  <= 1 && $business_locations_records_count <= 1) {
            $business_verfiy = $live_db->table('business')->where('secret_key', $request->input('business_pin'))->first();
            $location_verfiy = $live_db->table('business_locations')->where('secret_key', $request->input('location_pin'))->first();
            // check if records exists
            if ($business_verfiy == null || $location_verfiy == null) {
                return redirect()->back()->with('error', 'Credentials does not match with our records');
            } else {
                try {
                    $tables_to_be_fetched = ['business', 'business_locations', 'users'];
                    DB::beginTransaction();

                    // fetch Business table record 
                    $get_business_table_record_data = $live_db->table('business')->where('id', $business_verfiy->id)->first();
                    $business_table_record_as_array = (array)$get_business_table_record_data;
                    $business_table_record_as_array_without_secret_key = Arr::except($business_table_record_as_array, ['secret_key']);
                    try {
                        // dd($live_db->table('users')->where('id', $get_business_table_record_data->owner_id)->first());
                        $local_db->table('business')->updateOrInsert(['id' => $get_business_table_record_data->id], $business_table_record_as_array);
                        if ($owner = $live_db->table('users')->where('id', $get_business_table_record_data->owner_id)->first()) {
                            try {
                                $local_db->table('users')->updateOrInsert(['id' => $owner->id], (array) $owner);
                            } catch (Exception $e) {
                                return dd($e);
                            }
                        }
                    } catch (Exception $e) {
                        DB::rollBack();
                        Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                        $output = __("messages.something_went_wrong");
                        return dd([$e, 'hell']);
                        return redirect()->back()->with('error', $output);
                    }

                    # Block 1

                    // Get Brands, Units, Categories, Warranties, Expense Categories 'invoice_schemes', 'invoice_layouts'
                    $cat_unit_brands_table = ['invoice_schemes', 'invoice_layouts'];
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

                    // fetch business_locations table record From Live DB
                    $get_business_location_table_record = $live_db->table('business_locations')->where('id', $location_verfiy->id)->first();
                    $get_business_location_table_record_as_array = (array)$get_business_location_table_record;
                    $get_business_location_table_record_as_array_without_secret_key = Arr::except($get_business_location_table_record_as_array, ['secret_key']);
                    try {
                        // update local DB business_locations table
                        $local_db->table('business_locations')->updateOrInsert(['id' => $get_business_location_table_record->id], $get_business_location_table_record_as_array);
                        try {
                            $location_id = $local_db->table('business_locations')->select('id')->where('id', $get_business_location_table_record->id)->first();
                            $location = 'location.' . $location_id->id;
                            $location_permission_query = $live_db->table('permissions')->where('name', $location);
                            $count_location_permission = $location_permission_query->count();
                            if ($count_location_permission > 0) {
                                $location_permission = $location_permission_query->first();
                                try {
                                    $local_db->table('permissions')->updateOrInsert(
                                        [
                                            'name' => $location_permission->name,
                                            'id' => $location_permission->id
                                        ],
                                        (array) $location_permission
                                    );
                                } catch (Exception $e) {
                                    DB::rollBack();
                                    Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                                    $output = __("messages.something_went_wrong");
                                    return dd($e);
                                    return redirect()->back()->with('error', $output);
                                }
                            }
                        } catch (Exception $e) {
                            DB::rollBack();
                            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                            $output = __("messages.something_went_wrong");
                            return dd($e);
                            return redirect()->back()->with('error', $output);
                        }
                    } catch (Exception $e) {
                        DB::rollBack();
                        Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                        $output = __("messages.something_went_wrong");
                        return dd($e);
                        return redirect()->back()->with('error', $output);
                    }



                    // get default permissions upto id = 81

                    $defult_permissions_count = $live_db->table('permissions')->count();
                    // dd($defult_permissions_count);
                    // dd($defult_permissions_count);
                    if ($defult_permissions_count > 0) {
                        $get_defult_permissions = $live_db->table('permissions')->where('id', '<=', 81)->get();
                        // dd($get_defult_permissions);
                        foreach ($get_defult_permissions as $defult_permission) {
                            try {
                                $local_db->table('permissions')->updateOrInsert(['id' => $defult_permission->id], (array) $defult_permission);
                            } catch (Exception $e) {
                                DB::rollBack();
                                Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                                $output = __("messages.something_went_wrong");
                                return dd($e);
                                // return redirect()->back()->with('error', $output);
                            }
                        }
                    }

                    // fetch user table record
                    $get_users_table_records = $live_db->table('users')->where('business_id', $business_verfiy->id)->get();
                    // dd($get_users_table_records);
                    // $get_users_table_records->pull(0);
                    // dd($get_users_table_records->all());
                    foreach ($get_users_table_records->all() as $user_record) {
                        // dd($user_record);
                        $user_record_as_array = (array)$user_record;
                        $check_for_location_access = User::can_user_access_this_location($location_verfiy->id, $business_verfiy->id, $user_record->id);
                        // dd($check_for_location_access);
                        if ($check_for_location_access) {
                            try {
                                $local_db->table('users')->updateOrInsert(['id' => $user_record->id], $user_record_as_array);
                            } catch (Exception $e) {
                                DB::rollBack();
                                Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                                $output = __("messages.something_went_wrong");
                                return dd($e);
                                return redirect()->back()->with('error', $output);
                            }
                            // check model has permission table for the specific user permissions
                            $model_has_permissions_count = $live_db->table('model_has_permissions')->where('model_type', 'App\User')->where('model_id', $user_record->id)->count();
                            // dd($model_has_permissions_count);

                            if ($model_has_permissions_count > 0) {

                                // fetch model_has_permission table records
                                $model_has_permissions = $live_db->table('model_has_permissions')->where('model_type', 'App\User')->where('model_id', $user_record->id)->get();

                                foreach ($model_has_permissions as $model_has_permission) {
                                    $model_has_permission_array = (array) $model_has_permission;
                                    // insert or update local DB model_has_permissions
                                    try {
                                        $local_db->table('model_has_permissions')->updateOrInsert(['model_id' => $model_has_permission->model_id], $model_has_permission_array);
                                    } catch (Exception $e) {
                                        DB::rollBack();
                                        Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                                        $output = __("messages.something_went_wrong");
                                        return dd($e);
                                        return redirect()->back()->with('error', $output);
                                    }

                                    // check live db permission table on the basis of permission_id in model_has_permissions
                                    $get_permissions = $live_db->table('permissions')->where('id', $model_has_permission->permission_id)->first();

                                    if ($get_permissions) {
                                        $get_permissions_as_array = (array) $get_permissions;

                                        // update local permissions table
                                        try {
                                            $local_db->table('permissions')->updateOrInsert(['id' => $get_permissions->id], $get_permissions_as_array);
                                        } catch (Exception $e) {
                                            DB::rollBack();
                                            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                                            $output = __("messages.something_went_wrong");
                                            return dd($e);
                                            return redirect()->back()->with('error', $output);
                                        }
                                    }
                                }
                            }
                            // dd("NNNNNNN");


                            // dd($local_db->table('permissions')->get());
                            // dd("Noooo");
                            //
                            // *** Get roles on basis of Business id
                            //  
                            $roles_table_records_query = $live_db->table('roles')->where('business_id', $business_verfiy->id);
                            // dd($roles_table_records_query->count());
                            $roles_table_records_count = $roles_table_records_query->count();
                            // dd($roles_table_records_count);

                            if ($roles_table_records_count > 0) {
                                $get_roles_table_records = $roles_table_records_query->get();

                                // dd($get_roles_table_records);
                                foreach ($get_roles_table_records as $role_record) {
                                    // dd($role_record);

                                    $role_record_as_array = (array)$role_record;
                                    try {
                                        $local_db->table('roles')->updateOrInsert(['id' => $role_record->id], $role_record_as_array);
                                        // roles_has_permissions from live DB
                                        // dd($role_record->id);

                                        // dd($live_db->table('role_has_permissions')->where('role_id', $role_record->id)->get());
                                        $roles_has_permissions_records = $live_db->table('role_has_permissions')->where('role_id', $role_record->id)->get();

                                        // dd($roles_has_permissions_records);
                                        foreach ($roles_has_permissions_records as $r_h_p_record) {
                                            if (!($local_db->table('role_has_permissions')->where('role_id', $r_h_p_record->role_id)->where('permission_id', $r_h_p_record->permission_id)->first())) {
                                                $local_db->table('role_has_permissions')->insert((array)$r_h_p_record);
                                            }
                                        }
                                    } catch (Exception $e) {
                                        DB::rollBack();
                                        Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                                        $output = __("messages.something_went_wrong");
                                        return dd($e);
                                        // return redirect()->back()->with('error', $output);
                                    }
                                }

                                $get_roles_table_records_as_array = (array) $get_roles_table_records;
                                // Insert  into local DB Roles table

                            }

                            // $live_db->table()
                            $model_has_roles = $live_db->table('model_has_roles')->where('model_type', 'App\User')->where('model_id', $user_record->id)->get();

                            if ($model_has_roles) {
                                foreach ($model_has_roles as $model_has_role) {
                                    $model_has_role_as_array = (array) $model_has_role;
                                    try {
                                        $local_db->table('model_has_roles')->updateOrInsert(['model_id' => $model_has_role->model_id, 'model_type' => $model_has_role->model_type, 'role_id' => $model_has_role->role_id], $model_has_role_as_array);
                                    } catch (Exception $e) {
                                        DB::rollBack();
                                        Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                                        $output = __("messages.something_went_wrong");
                                        return $e;
                                        // return redirect()->back()->with('error', $output);
                                    }
                                    // fetch roles from live db
                                    $get_roles_table_records = $live_db->table('roles')->where('id', $model_has_role->role_id)->first();

                                    if ($get_roles_table_records) {
                                        $get_roles_table_records_as_array = (array) $get_roles_table_records;
                                        // Insert  into local DB Roles table
                                        try {
                                            $local_db->table('roles')->updateOrInsert(['id' => $get_roles_table_records->id], $get_roles_table_records_as_array);
                                        } catch (Exception $e) {
                                            DB::rollBack();
                                            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                                            $output = __("messages.something_went_wrong");
                                            return $e;
                                            // return redirect()->back()->with('error', $output);
                                        }
                                    }
                                }
                            }
                        }
                    }

                    # Block 2

                    # Block 2 End

                    $vls_arr = [];

                    # Block 3



                    //                    dd($vls_arr);
                    DB::commit();
                    return redirect('login')->with('success', 'Your system is ready! <br> Please Login and get started');
                } catch (Exception $e) {
                    DB::rollBack();
                    Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                    $output = __("messages.something_went_wrong");
                    if (isset($err)) {
                        return dd([$e, $err]);
                    } else {
                        return dd([$e]);
                    }

                    // return redirect()->back()->with('error', $output);
                }
            }
        } else {
            return redirect()->back()->with('error', 'Multiple Businesses Or Locations With Same Key Found');
        }
    }
    /**
     * Handles the validation username
     *
     * @return \Illuminate\Http\Response
     */
    public function postCheckUsername(Request $request)
    {
        $username = $request->input('username');

        if (!empty($request->input('username_ext'))) {
            $username .= $request->input('username_ext');
        }

        $count = User::where('username', $username)->count();

        if ($count == 0) {
            echo "true";
            exit;
        } else {
            echo "false";
            exit;
        }
    }

    /**
     * Shows business settings form
     *
     * @return \Illuminate\Http\Response
     */
    public function getBusinessSettings()
    {

        if (!auth()->user()->can('business_settings.access')) {
            abort(403, 'Unauthorized action.');
        }

        $timezones = DateTimeZone::listIdentifiers(DateTimeZone::ALL);
        $timezone_list = [];
        foreach ($timezones as $timezone) {
            $timezone_list[$timezone] = $timezone;
        }

        $business_id = request()->session()->get('user.business_id');
        $business = Business::where('id', $business_id)->first();

        $currencies = $this->businessUtil->allCurrencies();
        $tax_details = TaxRate::forBusinessDropdown($business_id);
        $tax_rates = $tax_details['tax_rates'];

        $months = [];
        for ($i = 1; $i <= 12; $i++) {
            $months[$i] = __('business.months.' . $i);
        }

        $accounting_methods = [
            'fifo' => __('business.fifo'),
            'lifo' => __('business.lifo')
        ];
        $commission_agent_dropdown = [
            '' => __('lang_v1.disable'),
            'logged_in_user' => __('lang_v1.logged_in_user'),
            'user' => __('lang_v1.select_from_users_list'),
            'cmsn_agnt' => __('lang_v1.select_from_commisssion_agents_list')
        ];

        $units_dropdown = Unit::forDropdown($business_id, true);

        $date_formats = Business::date_formats();

        $shortcuts = json_decode($business->keyboard_shortcuts, true);

        $pos_settings = empty($business->pos_settings) ? $this->businessUtil->defaultPosSettings() : json_decode($business->pos_settings, true);

        $email_settings = empty($business->email_settings) ? $this->businessUtil->defaultEmailSettings() : $business->email_settings;

        $sms_settings = empty($business->sms_settings) ? $this->businessUtil->defaultSmsSettings() : $business->sms_settings;

        $modules = $this->moduleUtil->availableModules();

        $theme_colors = $this->theme_colors;

        $mail_drivers = $this->mailDrivers;

        $allow_superadmin_email_settings = System::getProperty('allow_email_settings_to_businesses');

        $custom_labels = !empty($business->custom_labels) ? json_decode($business->custom_labels, true) : [];

        $common_settings = !empty($business->common_settings) ? $business->common_settings : [];

        $weighing_scale_setting = !empty($business->weighing_scale_setting) ? $business->weighing_scale_setting : [];

        return view('business.settings', compact('business', 'currencies', 'tax_rates', 'timezone_list', 'months', 'accounting_methods', 'commission_agent_dropdown', 'units_dropdown', 'date_formats', 'shortcuts', 'pos_settings', 'modules', 'theme_colors', 'email_settings', 'sms_settings', 'mail_drivers', 'allow_superadmin_email_settings', 'custom_labels', 'common_settings', 'weighing_scale_setting'));
    }

    /**
     * Updates business settings
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function postBusinessSettings(Request $request)
    {
        if (!auth()->user()->can('business_settings.access')) {
            abort(403, 'Unauthorized action.');
        }

        try {
            $notAllowed = $this->businessUtil->notAllowedInDemo();
            if (!empty($notAllowed)) {
                return $notAllowed;
            }

            $business_details = $request->only([
                'name', 'start_date', 'currency_id', 'tax_label_1', 'tax_number_1', 'tax_label_2', 'tax_number_2', 'default_profit_percent', 'default_sales_tax', 'default_sales_discount', 'sell_price_tax', 'sku_prefix', 'time_zone', 'fy_start_month', 'accounting_method', 'transaction_edit_days', 'sales_cmsn_agnt', 'item_addition_method', 'currency_symbol_placement', 'on_product_expiry',
                'stop_selling_before', 'default_unit', 'expiry_type', 'date_format',
                'time_format', 'ref_no_prefixes', 'theme_color', 'email_settings',
                'sms_settings', 'rp_name', 'amount_for_unit_rp',
                'min_order_total_for_rp', 'max_rp_per_order',
                'redeem_amount_per_unit_rp', 'min_order_total_for_redeem',
                'min_redeem_point', 'max_redeem_point', 'rp_expiry_period',
                'rp_expiry_type', 'custom_labels', 'weighing_scale_setting',
                'code_label_1', 'code_1', 'code_label_2', 'code_2'
            ]);

            if (!empty($request->input('enable_rp')) &&  $request->input('enable_rp') == 1) {
                $business_details['enable_rp'] = 1;
            } else {
                $business_details['enable_rp'] = 0;
            }

            $business_details['amount_for_unit_rp'] = !empty($business_details['amount_for_unit_rp']) ? $this->businessUtil->num_uf($business_details['amount_for_unit_rp']) : 1;
            $business_details['min_order_total_for_rp'] = !empty($business_details['min_order_total_for_rp']) ? $this->businessUtil->num_uf($business_details['min_order_total_for_rp']) : 1;
            $business_details['redeem_amount_per_unit_rp'] = !empty($business_details['redeem_amount_per_unit_rp']) ? $this->businessUtil->num_uf($business_details['redeem_amount_per_unit_rp']) : 1;
            $business_details['min_order_total_for_redeem'] = !empty($business_details['min_order_total_for_redeem']) ? $this->businessUtil->num_uf($business_details['min_order_total_for_redeem']) : 1;

            $business_details['default_profit_percent'] = !empty($business_details['default_profit_percent']) ? $this->businessUtil->num_uf($business_details['default_profit_percent']) : 0;

            $business_details['default_sales_discount'] = !empty($business_details['default_sales_discount']) ? $this->businessUtil->num_uf($business_details['default_sales_discount']) : 0;

            if (!empty($business_details['start_date'])) {
                $business_details['start_date'] = $this->businessUtil->uf_date($business_details['start_date']);
            }

            if (!empty($request->input('enable_tooltip')) &&  $request->input('enable_tooltip') == 1) {
                $business_details['enable_tooltip'] = 1;
            } else {
                $business_details['enable_tooltip'] = 0;
            }

            $business_details['enable_product_expiry'] = !empty($request->input('enable_product_expiry')) &&  $request->input('enable_product_expiry') == 1 ? 1 : 0;
            if ($business_details['on_product_expiry'] == 'keep_selling') {
                $business_details['stop_selling_before'] = null;
            }

            $business_details['stock_expiry_alert_days'] = !empty($request->input('stock_expiry_alert_days')) ? $request->input('stock_expiry_alert_days') : 30;

            //Check for Purchase currency
            if (!empty($request->input('purchase_in_diff_currency')) &&  $request->input('purchase_in_diff_currency') == 1) {
                $business_details['purchase_in_diff_currency'] = 1;
                $business_details['purchase_currency_id'] = $request->input('purchase_currency_id');
                $business_details['p_exchange_rate'] = $request->input('p_exchange_rate');
            } else {
                $business_details['purchase_in_diff_currency'] = 0;
                $business_details['purchase_currency_id'] = null;
                $business_details['p_exchange_rate'] = 1;
            }

            //upload logo
            $logo_name = $this->businessUtil->uploadFile($request, 'business_logo', 'business_logos', 'image');
            if (!empty($logo_name)) {
                $business_details['logo'] = $logo_name;
            }

            $checkboxes = [
                'enable_editing_product_from_purchase',
                'enable_inline_tax',
                'enable_brand', 'enable_category', 'enable_sub_category', 'enable_price_tax', 'enable_purchase_status',
                'enable_lot_number', 'enable_racks', 'enable_row', 'enable_position', 'enable_sub_units'
            ];
            foreach ($checkboxes as $value) {
                $business_details[$value] = !empty($request->input($value)) &&  $request->input($value) == 1 ? 1 : 0;
            }

            $business_id = request()->session()->get('user.business_id');
            $business = Business::where('id', $business_id)->first();

            //Update business settings
            if (!empty($business_details['logo'])) {
                $business->logo = $business_details['logo'];
            } else {
                unset($business_details['logo']);
            }

            //System settings
            $shortcuts = $request->input('shortcuts');
            $business_details['keyboard_shortcuts'] = json_encode($shortcuts);

            //pos_settings
            $pos_settings = $request->input('pos_settings');
            $default_pos_settings = $this->businessUtil->defaultPosSettings();
            foreach ($default_pos_settings as $key => $value) {
                if (!isset($pos_settings[$key])) {
                    $pos_settings[$key] = $value;
                }
            }
            $business_details['pos_settings'] = json_encode($pos_settings);

            $business_details['custom_labels'] = json_encode($business_details['custom_labels']);

            $business_details['common_settings'] = !empty($request->input('common_settings')) ? $request->input('common_settings') : [];

            //Enabled modules
            $enabled_modules = $request->input('enabled_modules');
            $business_details['enabled_modules'] = !empty($enabled_modules) ? $enabled_modules : null;

            $business->fill($business_details);
            $business->save();

            //update session data
            $request->session()->put('business', $business);

            //Update Currency details
            $currency = Currency::find($business->currency_id);
            $request->session()->put('currency', [
                'id' => $currency->id,
                'code' => $currency->code,
                'symbol' => $currency->symbol,
                'thousand_separator' => $currency->thousand_separator,
                'decimal_separator' => $currency->decimal_separator,
            ]);

            //update current financial year to session
            $financial_year = $this->businessUtil->getCurrentFinancialYear($business->id);
            $request->session()->put('financial_year', $financial_year);

            $output = [
                'success' => 1,
                'msg' => __('business.settings_updated_success')
            ];
        } catch (\Exception $e) {
            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());

            $output = [
                'success' => 0,
                'msg' => __('messages.something_went_wrong')
            ];
        }
        return redirect('business/settings')->with('status', $output);
    }

    /**
     * Handles the validation email
     *
     * @return \Illuminate\Http\Response
     */
    public function postCheckEmail(Request $request)
    {
        $email = $request->input('email');

        $query = User::where('email', $email);

        if (!empty($request->input('user_id'))) {
            $user_id = $request->input('user_id');
            $query->where('id', '!=', $user_id);
        }

        $exists = $query->exists();
        if (!$exists) {
            echo "true";
            exit;
        } else {
            echo "false";
            exit;
        }
    }

    public function getEcomSettings()
    {
        try {
            $api_token = request()->header('API-TOKEN');
            $api_settings = $this->moduleUtil->getApiSettings($api_token);

            $settings = Business::where('id', $api_settings->business_id)
                ->value('ecom_settings');

            $settings_array = !empty($settings) ? json_decode($settings, true) : [];

            if (!empty($settings_array['slides'])) {
                foreach ($settings_array['slides'] as $key => $value) {
                    $settings_array['slides'][$key]['image_url'] = !empty($value['image']) ? url('uploads/img/' . $value['image']) : '';
                }
            }
        } catch (\Exception $e) {
            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());

            return $this->respondWentWrong($e);
        }

        return $this->respond($settings_array);
    }

    /**
     * Handles the testing of email configuration
     *
     * @return \Illuminate\Http\Response
     */
    public function testEmailConfiguration(Request $request)
    {
        try {
            $email_settings = $request->input();

            $data['email_settings'] = $email_settings;
            \Notification::route('mail', $email_settings['mail_from_address'])
                ->notify(new TestEmailNotification($data));

            $output = [
                'success' => 1,
                'msg' => __('lang_v1.email_tested_successfully')
            ];
        } catch (\Exception $e) {
            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
            $output = [
                'success' => 0,
                'msg' => $e->getMessage()
            ];
        }

        return $output;
    }

    /**
     * Handles the testing of sms configuration
     *
     * @return \Illuminate\Http\Response
     */
    public function testSmsConfiguration(Request $request)
    {
        try {
            $sms_settings = $request->input();

            $data = [
                'sms_settings' => $sms_settings,
                'mobile_number' => $sms_settings['test_number'],
                'sms_body' => 'This is a test SMS',
            ];
            if (!empty($sms_settings['test_number'])) {
                $response = $this->businessUtil->sendSms($data);
            } else {
                $response = __('lang_v1.test_number_is_required');
            }

            $output = [
                'success' => 1,
                'msg' => $response
            ];
        } catch (\Exception $e) {
            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
            $output = [
                'success' => 0,
                'msg' => $e->getMessage()
            ];
        }

        return $output;
    }
}