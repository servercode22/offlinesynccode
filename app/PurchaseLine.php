<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PurchaseLine extends Model
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
    
    public function transaction()
    {
        return $this->belongsTo(\App\Transaction::class);
    }

    public function product()
    {
        return $this->belongsTo(\App\Product::class, 'product_id');
    }

    public function variations()
    {
        return $this->belongsTo(\App\Variation::class, 'variation_id');
    }

    /**
     * Set the quantity.
     *
     * @param  string  $value
     * @return float $value
     */
    public function getQuantityAttribute($value)
    {
        return (float)$value;
    }

    /**
     * Get the unit associated with the purchase line.
     */
    public function sub_unit()
    {
        return $this->belongsTo(\App\Unit::class, 'sub_unit_id');
    }

    /**
     * Give the quantity remaining for a particular
     * purchase line.
     *
     * @return float $value
     */
    public function getQuantityRemainingAttribute()
    {
        return (float)($this->quantity - $this->quantity_used);
    }

    /**
     * Give the sum of quantity sold, adjusted, returned.
     *
     * @return float $value
     */
    public function getQuantityUsedAttribute()
    {
        return (float)($this->quantity_sold + $this->quantity_adjusted + $this->quantity_returned + $this->mfg_quantity_used);
    }

    public function line_tax()
    {
        return $this->belongsTo(\App\TaxRate::class, 'tax_id');
    }

    public function purchase_order_line()
    {
        return $this->belongsTo(\App\PurchaseLine::class, 'purchase_order_line_id');
    }
}
