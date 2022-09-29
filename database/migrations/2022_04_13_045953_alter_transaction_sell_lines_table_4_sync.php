<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTransactionSellLinesTable4Sync extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE transaction_sell_lines Modify COLUMN `id` varchar(255)");
        DB::statement("ALTER TABLE transaction_sell_lines Modify COLUMN `parent_sell_line_id` varchar(255)");
        DB::statement("ALTER TABLE transaction_sell_lines Add `ai_id` INT NOT NULL AUTO_INCREMENT AFTER  `id`,  ADD INDEX (ai_id)");

        Schema::table('transaction_sell_lines', function (Blueprint $table) {
            $table->boolean('sync_status')->default(false)->after('ai_id');
            // $table->string('parent_sell_line_id')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('transaction_sell_lines', function (Blueprint $table) {
            $table->dropColumn('ai_id');
            $table->dropColumn('sync_status');
        });
    }
}
