<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTransactionTable4Sync extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE transactions Modify COLUMN `id` varchar(255)");
        DB::statement("ALTER TABLE transactions Add `ai_id` INT NOT NULL AUTO_INCREMENT AFTER  `id`,  ADD INDEX (ai_id)");
        DB::statement("ALTER TABLE transactions Modify COLUMN `contact_id` varchar(255)");
        Schema::table('transactions', function (Blueprint $table) {
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
        Schema::table('transactions', function (Blueprint $table) {
            $table->dropColumn('ai_id');
            $table->dropColumn('sync_status');
        });
    }
}
