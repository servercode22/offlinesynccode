<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTransactionPaymentsTable4Sync extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE transaction_payments Modify COLUMN `id` varchar(255)");
        DB::statement("ALTER TABLE transaction_payments Add `ai_id` INT NOT NULL UNIQUE AUTO_INCREMENT AFTER  `id`");
        DB::statement("ALTER TABLE transaction_payments Modify COLUMN `parent_id` varchar(255)");
        DB::statement("ALTER TABLE transaction_payments Modify COLUMN `transaction_id` varchar(255)");

        Schema::table('transaction_payments', function (Blueprint $table) {
            $table->boolean('sync_status')->default(false)->after('ai_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('transaction_payments', function (Blueprint $table) {
            $table->dropColumn('ai_id');
            $table->dropColumn('sync_status');
        });
    }
}
