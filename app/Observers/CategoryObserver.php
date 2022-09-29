<?php

namespace App\Observers;

use App\Category;

class CategoryObserver
{
    public function creating(Category $model)
    {

        $business_id = request()->session()->get('user.business_id');
        $location_id = request()->session()->get('business_location.id');
        $last_row = Category::latest('ai_id')->first();
        if (!isset($last_row) && $last_row == null) {
            $last_id = "A-" . $business_id . "-" . $location_id . "-0";
            $model->id = $last_id;
        } else {
            $latest_id = $last_row->ai_id;
            $num2alpha = Category::num2alpha($latest_id + 1);
            $model->id = $num2alpha  . '-' . $business_id . '-' . $location_id . '-' . ($latest_id + 1);
        }
    }
}
