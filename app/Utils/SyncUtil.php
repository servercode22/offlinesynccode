<?php
namespace App\Utils; 
use DB;
use Illuminate\Support\Facades\DB; 
class SyncUtil extends Util{ 
     $live_db=DB::connection('mysql_2'); 
    $local_db=DB::connection('mysql'); 
}
?>