<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterCashRegistersTable4Sync extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE cash_register_transactions DROP CONSTRAINT cash_register_transactions_cash_register_id_foreign");
        DB::statement("ALTER TABLE cash_registers Modify COLUMN `id` varchar(255)");
        DB::statement("ALTER TABLE cash_registers Add `ai_id` INT NOT NULL UNIQUE AUTO_INCREMENT AFTER  `id`");

        DB::statement("ALTER TABLE cash_register_transactions Modify COLUMN `cash_register_id` varchar(255)");
        DB::statement("ALTER TABLE cash_register_transactions Modify COLUMN `id` varchar(255)");
        DB::statement("ALTER TABLE cash_register_transactions Add `ai_id` INT NOT NULL UNIQUE AUTO_INCREMENT AFTER  `id`");
        DB::statement("ALTER TABLE cash_register_transactions ADD CONSTRAINT cash_register_transactions_cash_register_id_foreign FOREIGN KEY (`cash_register_id`)
        REFERENCES `cash_registers` (`id`)");

        DB::statement("ALTER TABLE cash_register_transactions Modify COLUMN `transaction_id` varchar(255)");

        Schema::table('cash_registers', function (Blueprint $table) {
            $table->boolean('sync_status')->default(false)->after('ai_id');
        });

        Schema::table('cash_register_transactions', function (Blueprint $table) {
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
        Schema::table('cash_registers', function (Blueprint $table) {
            $table->dropColumn('ai_id');
            $table->dropColumn('sync_status');
        });

        Schema::table('cash_register_transactions', function (Blueprint $table) {
            $table->dropColumn('ai_id');
            $table->dropColumn('sync_status');
        });
    }
}
