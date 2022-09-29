<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Warranty extends Model
{
    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];
    public $incrementing = false;

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

    public static function forDropdown($business_id)
    {
        $warranties = Warranty::where('business_id', $business_id)
                            ->get();
        $dropdown = [];

        foreach ($warranties as $warranty) {
            $dropdown[$warranty->id] = $warranty->name . ' (' . $warranty->duration . ' ' . __('lang_v1.' . $warranty->duration_type) . ')';
        }
        
        return $dropdown;
    }

    /**
     * Get the display name.
     *
     * @return string
     */
    public function getDisplayNameAttribute()
    {
        $name = $this->name . ' (' . $this->duration . ' ' . __('lang_v1.' . $this->duration_type) . ')';
        return $name;
    }

    public function getEndDate($date)
    {
        $date_obj = \Carbon::parse($date);

        if ($this->duration_type == 'days') {
            $date_obj->addDays($this->duration);
        } elseif ($this->duration_type == 'months') {
            $date_obj->addMonths($this->duration);
        } elseif ($this->duration_type == 'years') {
            $date_obj->addYears($this->duration);
        }

        return $date_obj->toDateTimeString();
    }
}
