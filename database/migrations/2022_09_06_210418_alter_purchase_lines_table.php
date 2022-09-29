<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class AlterPurchaseLinesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('purchase_lines', function (Blueprint $table) {
            // DB::statement("ALTER TABLE purchase_lines DROP CONSTRAINT purchase_lines_variation_id_foreign");

            DB::statement("ALTER TABLE purchase_lines Modify COLUMN `id` varchar(255)");
            DB::statement("ALTER TABLE purchase_lines Add `ai_id` INT NOT NULL UNIQUE AUTO_INCREMENT AFTER  `id`");
            DB::statement("ALTER TABLE purchase_lines Add COLUMN `sync_status` INT default 0 after `id`");
            DB::statement("ALTER TABLE purchase_lines Modify COLUMN `variation_id` varchar(255)");
            DB::statement("ALTER TABLE purchase_lines Modify COLUMN `product_id` varchar(255)");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('purchaselines', function (Blueprint $table) {
            //
        });
    }
}
