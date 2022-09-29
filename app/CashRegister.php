<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CashRegister extends Model
{
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'denominations' => 'array'
    ];

    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];

    public $incrementing = false;

    /**
     * The method to prefix the id on creation.
     *
     */

    public static function boot()
    {
        parent::boot();
        static::creating(function ($model) {
            $business_id = request()->session()->get('user.business_id');
            // $location_id = 3;
            $location_id = request()->session()->get('business_location.id');
            $last_row = CashRegister::latest('ai_id')->first();

            if (!isset($last_row) && $last_row == null) {
                $last_id = "A-" . $business_id . "-" . $location_id . "-0";
                $model->id = $last_id;
            } else {
                $latest_id = $last_row->ai_id;
                $num2alpha = CashRegister::num2alpha($latest_id + 1);
                $model->id = $num2alpha  . '-' . $business_id . '-' . $location_id . '-' . ($latest_id + 1);
            }
        });
    }
    static function num2alpha($n)
    {
        $r = '';
        for ($i = 1; $n >= 0 && $i < 10; $i++) {
            $r = chr(0x41 + ($n % pow(26, $i) / pow(26, $i - 1))) . $r;
            $n -= pow(26, $i);
        }
        return $r;
    }

    static function alpha2num($a)
    {
        $r = 0;
        $l = strlen($a);
        for ($i = 0; $i < $l; $i++) {
            $r += pow(26, $i) * (ord($a[$l - $i - 1]) - 0x40);
        }
        return $r - 1;
    }

    /**
     * Get the Cash registers transactions.
     */
    public function cash_register_transactions()
    {
        return $this->hasMany(\App\CashRegisterTransaction::class);
    }
}
