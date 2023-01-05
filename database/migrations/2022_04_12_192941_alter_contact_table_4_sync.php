<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterContactTable4Sync extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE contacts Modify Column `id` varchar(255)");
        DB::statement("ALTER TABLE contacts Add `ai_id` INT NOT NULL AUTO_INCREMENT AFTER  `id`,  ADD INDEX (ai_id)");

        Schema::table('contacts', function (Blueprint $table) {
            $table->boolean('sync_status')->default(false)->after('ai_id');
        });
        // DB::statement("ALTER TABLE bookings DROP CONSTRAINT bookings_contact_id_foreign");
        // DB::statement("ALTER TABLE transactions DROP CONSTRAINT transactions_contact_id_foreign");

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('contacts', function (Blueprint $table) {
            $table->dropColumn('ai_id');
            $table->dropColumn('sync_status');
        });
    }
}
