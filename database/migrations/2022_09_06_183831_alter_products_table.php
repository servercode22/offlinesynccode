<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class AlterProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('products', function (Blueprint $table) {
            DB::statement("ALTER TABLE product_variations DROP CONSTRAINT product_variations_product_id_foreign");
            DB::statement("ALTER TABLE purchase_lines DROP CONSTRAINT purchase_lines_product_id_foreign");
            DB::statement("ALTER TABLE res_product_modifier_sets DROP CONSTRAINT res_product_modifier_sets_modifier_set_id_foreign");
            DB::statement("ALTER TABLE stock_adjustment_lines DROP CONSTRAINT stock_adjustment_lines_product_id_foreign");
            DB::statement("ALTER TABLE transaction_sell_lines DROP CONSTRAINT transaction_sell_lines_product_id_foreign");
            DB::statement("ALTER TABLE variations DROP CONSTRAINT variations_product_id_foreign");

            DB::statement("ALTER TABLE products Modify COLUMN `id` varchar(255)");
            DB::statement("ALTER TABLE products Add COLUMN `sync_status` INT default 0");
            DB::statement("ALTER TABLE products Add `ai_id` INT NOT NULL UNIQUE AUTO_INCREMENT AFTER  `id`");

            // Make a Sperate table for Foreign Key Constraints

            // DB::statement("ALTER TABLE product_variations ADD CONSTRAINT product_variations_product_id_foreign FOREIGN KEY (product_id) REFERENCES products (id) ");
            // DB::statement("ALTER TABLE purchase_lines ADD CONSTRAINT purchase_lines_product_id_foreign FOREIGN KEY (product_id) REFERENCES products (id)" );
            // DB::statement("ALTER TABLE res_product_modifier_sets ADD CONSTRAINT res_product_modifier_sets_modifier_set_id_foreign FOREIGN KEY (product_id) REFERENCES products (id)");
            // DB::statement("ALTER TABLE stock_adjustment_lines ADD CONSTRAINT stock_adjustment_lines_product_id_foreign FOREIGN KEY (product_id) REFERENCES products (id)");
            // DB::statement("ALTER TABLE transaction_sell_lines DROP CONSTRAINT transaction_sell_lines_product_id_foreign  FOREIGN KEY (product_id) REFERENCES products (id)");
            // DB::statement("ALTER TABLE variations DROP CONSTRAINT variations_product_id_foreign FOREIGN KEY (product_id) REFERENCES products (id)");

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('Products', function (Blueprint $table) {
            //
        });
    }
}
