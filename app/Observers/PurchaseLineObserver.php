<?php

namespace App\Observers;

use App\PurchaseLine;

class PurchaseLineObserver
{
    public function creating(PurchaseLine $model)
    {

        $business_id = request()->session()->get('user.business_id');
        // $location_id = 3;
        $location_id = request()->session()->get('business_location.id');
        $last_row = PurchaseLine::latest('ai_id')->first();

        if (!isset($last_row) && $last_row == null) {
            $last_id = "A-" . $business_id . "-" . $location_id . "-0";
            $model->id = $last_id;
        } else {
            $latest_id = $last_row->ai_id;
            $num2alpha = PurchaseLine::num2alpha($latest_id + 1);
            $model->id = $num2alpha  . '-' . $business_id . '-' . $location_id . '-' . ($latest_id + 1);
        }
    }

    public function updating (PurchaseLine $model){
        $model->sync_status = 0;
    }
}
