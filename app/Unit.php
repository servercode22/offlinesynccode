<?php

namespace App;

use DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Unit extends Model
{
    use SoftDeletes;
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
    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    
    
    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * Return list of units for a business
     *
     * @param int $business_id
     * @param boolean $show_none = true
     *
     * @return array
     */
    public static function forDropdown($business_id, $show_none = false, $only_base = true)
    {
        $query = Unit::where('business_id', $business_id);
        if ($only_base) {
            $query->whereNull('base_unit_id');
        }

        $units = $query->select(DB::raw('CONCAT(actual_name, " (", short_name, ")") as name'), 'id')->get();
        $dropdown = $units->pluck('name', 'id');
        if ($show_none) {
            $dropdown->prepend(__('messages.please_select'), '');
        }
        
        return $dropdown;
    }

    public function sub_units()
    {
        return $this->hasMany(\App\Unit::class, 'base_unit_id');
    }

    public function base_unit()
    {
        return $this->belongsTo(\App\Unit::class, 'base_unit_id');
    }
}
