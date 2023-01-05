<?php

namespace App\Console\Commands;

use App\Http\Controllers\SyncApiController;
use Illuminate\Console\Command;

class SaleSync extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sale:sync';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Sync Sales Data Automatically';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $sync = new SyncApiController;
        $sync->syncSale();
        $this->info("Sale Synced Successfully");
    }
}