<?php

namespace App\Providers;

use App\Brands;
use App\Category;
use App\Observers\BrandObserver;
use App\Observers\CategoryObserver;
use App\Observers\ProductObserver;
use App\Observers\ProductVariationObserver;
use App\Observers\PurchaseLineObserver;
use App\Observers\TransactionObserver;
use App\Observers\UnitObserver;
use App\Observers\VariationLocationDetailsObserver;
use App\Observers\VariationObserver;
use App\Observers\WarrantyObserver;
use App\Product;
use App\ProductVariation;
use App\PurchaseLine;
use App\Transaction;
use App\Unit;
use App\Variation;
use App\VariationLocationDetails;
use App\Warranty;
use Illuminate\Support\Facades\Event;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        // 'App\Events\Event' => [
        //     'App\Listeners\EventListener',
        // ],
        \App\Events\TransactionPaymentAdded::class => [
            \App\Listeners\AddAccountTransaction::class,
        ],

        \App\Events\TransactionPaymentUpdated::class => [
            \App\Listeners\UpdateAccountTransaction::class,
        ],

        \App\Events\TransactionPaymentDeleted::class => [
            \App\Listeners\DeleteAccountTransaction::class,
        ],
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //Transaction
        Transaction::observe(TransactionObserver::class);
        Product::observe(ProductObserver::class);
        ProductVariation::observe(ProductVariationObserver::class);
        PurchaseLine::observe(PurchaseLineObserver::class);
        Variation::observe(VariationObserver::class);
        VariationLocationDetails::observe(VariationLocationDetailsObserver::class);
        Category::observe(CategoryObserver::class);
        Unit::observe(UnitObserver::class);
        Brands::observe(BrandObserver::class);
        Warranty::observe(WarrantyObserver::class);
    }
}
