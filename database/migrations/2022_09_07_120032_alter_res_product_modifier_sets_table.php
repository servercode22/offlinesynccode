<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class AlterResProductModifierSetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('res_product_modifier_sets', function (Blueprint $table) {

            DB::statement("ALTER TABLE res_product_modifier_sets Modify COLUMN `modifier_set_id` varchar(255)");
            DB::statement("ALTER TABLE res_product_modifier_sets Modify COLUMN `product_id` varchar(255)");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('res_product_modifier_sets', function (Blueprint $table) {
            //
        });
    }
}
