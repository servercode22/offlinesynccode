<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Events\TransactionPaymentDeleted;
use App\Events\TransactionPaymentUpdated;

class TransactionPayment extends Model
{
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
    { // $location_id = str_pad('1', 1, 0, STR_PAD_LEFT);
        parent::boot();
        static::creating(function ($model) {
            $business_id = request()->session()->get('user.business_id');
            // $location_id = 3;
            $location_id = request()->session()->get('business_location.id');
            $last_row = TransactionPayment::latest('ai_id')->first();

            if (!isset($last_row) && $last_row == null) {
                $last_id = "A-" . $business_id . "-" . $location_id . "-0";
                $model->id = $last_id;
            } else {
                $latest_id = $last_row->ai_id;
                $num2alpha = TransactionPayment::num2alpha($latest_id + 1);
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
     * Get the phone record associated with the user.
     */
    public function payment_account()
    {
        return $this->belongsTo(\App\Account::class, 'account_id');
    }

    /**
     * Get the transaction related to this payment.
     */
    public function transaction()
    {
        return $this->belongsTo(\App\Transaction::class, 'transaction_id');
    }

    /**
     * Get the user.
     */
    public function created_user()
    {
        return $this->belongsTo(\App\User::class, 'created_by');
    }

    /**
     * Get child payments
     */
    public function child_payments()
    {
        return $this->hasMany(\App\TransactionPayment::class, 'parent_id');
    }

    /**
     * Retrieves documents path if exists
     */
    public function getDocumentPathAttribute()
    {
        $path = !empty($this->document) ? asset('/uploads/documents/' . $this->document) : null;

        return $path;
    }

    /**
     * Removes timestamp from document name
     */
    public function getDocumentNameAttribute()
    {
        $document_name = !empty(explode("_", $this->document, 2)[1]) ? explode("_", $this->document, 2)[1] : $this->document;
        return $document_name;
    }

    public static function deletePayment($payment)
    {
        //Update parent payment if exists
        if (!empty($payment->parent_id)) {
            $parent_payment = TransactionPayment::find($payment->parent_id);
            $parent_payment->amount -= $payment->amount;

            if ($parent_payment->amount <= 0) {
                $parent_payment->delete();
                event(new TransactionPaymentDeleted($parent_payment));
            } else {
                $parent_payment->save();
                //Add event to update parent payment account transaction
                event(new TransactionPaymentUpdated($parent_payment, null));
            }
        }

        $payment->delete();

        $transactionUtil = new \App\Utils\TransactionUtil();

        if (!empty($payment->transaction_id)) {
            //update payment status
            $transaction = $payment->load('transaction')->transaction;
            $transaction_before = $transaction->replicate();

            $payment_status = $transactionUtil->updatePaymentStatus($payment->transaction_id);

            $transaction->payment_status = $payment_status;

            $transactionUtil->activityLog($transaction, 'payment_edited', $transaction_before);
        }

        $log_properities = [
            'id' => $payment->id,
            'ref_no' => $payment->payment_ref_no
        ];
        $transactionUtil->activityLog($payment, 'payment_deleted', null, $log_properities);

        //Add event to delete account transaction
        event(new TransactionPaymentDeleted($payment));
    }
}
