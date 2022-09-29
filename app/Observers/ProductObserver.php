<?php

namespace App\Observers;

use App\Product;

class ProductObserver
{
    //public $afterCommit = true;


    /**
     * Handle the Product "created" event.
     *
     * @param  \App\Product  $product
     * @return void
     */
    public function created(Product $product)
    {
        //
    }

    public function creating(Product $model)
    {

        $business_id = request()->session()->get('user.business_id');
        // $location_id = 3;
        $location_id = request()->session()->get('business_location.id');
        $last_row = Product::latest('ai_id')->first();

        if (!isset($last_row) && $last_row == null) {
            $last_id = "A-" . $business_id . "-" . $location_id . "-0";
            $model->id = $last_id;
        } else {
            $latest_id = $last_row->ai_id;
            $num2alpha = Product::num2alpha($latest_id + 1);
            $model->id = $num2alpha  . '-' . $business_id . '-' . $location_id . '-' . ($latest_id + 1);
        }
    }

    public function updating(Product $product)
    {
        $product->sync_status = 0;
    }

    /**
     * Handle the product "updated" event.
     *
     * @param  \App\Product  $product
     * @return void
     */
    public function updated(Product $product)
    {
        
        // $product->sync_status = 5;
        // dd($product->id , $product->sync_status);
        // $product->save([]);
    }

    /**
     * Handle the product "deleted" event.
     *
     * @param  \App\product  $product
     * @return void
     */
    public function deleted(Product $product)
    {
        //
    }

    /**
     * Handle the product "restored" event.
     *
     * @param  \App\product  $product
     * @return void
     */
    public function restored(product $product)
    {
        //
    }

    /**
     * Handle the product "force deleted" event.
     *
     * @param  \App\Product  $product
     * @return void
     */
    public function forceDeleted(Product $product)
    {
        //
    }
}
