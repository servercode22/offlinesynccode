<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class AlterVariationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('variations', function (Blueprint $table) {

            DB::statement("ALTER TABLE purchase_lines DROP CONSTRAINT purchase_lines_variation_id_foreign");
            DB::statement("ALTER TABLE stock_adjustment_lines DROP CONSTRAINT stock_adjustment_lines_variation_id_foreign");
            DB::statement("ALTER TABLE transaction_sell_lines DROP CONSTRAINT transaction_sell_lines_variation_id_foreign");
            DB::statement("ALTER TABLE variation_group_prices DROP CONSTRAINT variation_group_prices_variation_id_foreign");
            DB::statement("ALTER TABLE variation_location_details DROP CONSTRAINT variation_location_details_variation_id_foreign");


            DB::statement("ALTER TABLE variations Modify COLUMN `id` varchar(255)");
            DB::statement("ALTER TABLE variations Add `ai_id` INT NOT NULL UNIQUE AUTO_INCREMENT AFTER  `id`");
            DB::statement("ALTER TABLE variations Add COLUMN `sync_status` INT default 0 after `id`");
            DB::statement("ALTER TABLE variations Modify COLUMN `product_id` varchar(255)");
            DB::statement("ALTER TABLE variations Modify COLUMN `product_variation_id` varchar(255)");


            // DB::statement("ALTER TABLE purchase_lines ADD CONSTRAINT purchase_lines_variation_id_foreign FOREIGN KEY (variation_id) REFERENCES variations (id) ");
            // DB::statement("ALTER TABLE stock_adjustment_lines ADD CONSTRAINT stock_adjustment_lines_variation_id_foreign FOREIGN KEY (variation_id) REFERENCES variations (id) ");
            // DB::statement("ALTER TABLE transaction_sell_lines ADD CONSTRAINT transaction_sell_lines_variation_id_foreign FOREIGN KEY (variation_id) REFERENCES variations (id) ");
            // DB::statement("ALTER TABLE variation_group_prices ADD CONSTRAINT variation_group_prices_variation_id_foreign FOREIGN KEY (variation_id) REFERENCES variations (id) ");
            // DB::statement("ALTER TABLE variation_location_details ADD CONSTRAINT variation_location_details FOREIGN KEY (variation_id) REFERENCES variations (id) ");

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('variations', function (Blueprint $table) {
            //
        });
    }
}
