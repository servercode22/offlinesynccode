<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class AlterVariationLocationDerails extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('variation_location_details', function (Blueprint $table) {
            DB::statement("ALTER TABLE variation_location_details Modify COLUMN `id` varchar(255)");
            DB::statement("ALTER TABLE variation_location_details Add `ai_id` INT NOT NULL UNIQUE AUTO_INCREMENT AFTER  `id`");
            DB::statement('ALTER TABLE variation_location_details Add COLUMN `sync_status` INT default 0 after `id`');
            DB::statement("ALTER TABLE variation_location_details Modify COLUMN `product_variation_id` varchar(255)");
            DB::statement("ALTER TABLE variation_location_details Modify COLUMN `product_id` varchar(255)");
            DB::statement("ALTER TABLE variation_location_details Modify COLUMN `variation_id` varchar(255)");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('variation_location_details', function (Blueprint $table) {
            //
        });
    }
}
