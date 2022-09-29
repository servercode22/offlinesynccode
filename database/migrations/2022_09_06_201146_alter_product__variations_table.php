<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class AlterProductVariationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('product_variations', function (Blueprint $table) {
            DB::statement("ALTER TABLE variations DROP CONSTRAINT variations_product_variation_id_foreign");

            DB::statement("ALTER TABLE product_variations Modify COLUMN `id` varchar(255)");
            DB::statement("ALTER TABLE product_variations Add COLUMN `sync_status` INT default 0 after `id`");
            DB::statement("ALTER TABLE product_variations Add `ai_id` INT NOT NULL UNIQUE AUTO_INCREMENT AFTER  `id`");
            DB::statement("ALTER TABLE product_variations Modify COLUMN `product_id` varchar(255)");
            // Make Sure that The New Foreign key constrains are added at the End of the All Migrations
            // DB::statement("ALTER TABLE variations DROP CONSTRAINT variations_product_variation_id_foreign FOREIGN KEY (variation_id) REFERENCES variations (id) ");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('product_variations', function (Blueprint $table) {
            //
        });
    }
}
