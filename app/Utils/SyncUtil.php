<?php
namespace App\Utils;

use App\Http\Resources\ProductResource;
use App\Product;
use Illuminate\Support\Facades\DB; 
use Illuminate\Support\Arr;

class SyncUtil extends Util{ 

    public function t(){
        dd("H");    
    }
    public function productsForSync($business_id , $location_id)
    {
        // if (!request()->has('business_id') || !request()->has('location_id')) {
        //     $msg = ['error' => 'Unauthenticated'];
        //     return json_encode($msg);
        // }
        
        $business_id = $business_id;
        $location_id = $location_id;


        $filters = $location_id ;

    $products = $this->__getProductsForSync($business_id, $filters);

        return ProductResource::collection($products);
    }

    private function __getProductsForSync($business_id, $filters = [])
    {
        $query = Product::where('business_id', $business_id)
        ->where('sync_status' , 0)
        ;

        $with = ['product_variations.variations.variation_location_details', 'product_variations.variations.media', 'product_locations'];

        if (!empty($filters['location_id'])) {
            $location_id = $filters['location_id'];
            $query->whereHas('product_locations', function ($q) use ($location_id) {
                $q->where('product_locations.location_id', $location_id);
            });

            $with['product_variations.variations.variation_location_details'] = function ($q) use ($location_id) {
                $q->where('location_id', $location_id);
            };

            $with['product_locations'] = function ($q) use ($location_id) {
                $q->where('product_locations.location_id', $location_id);
            };
        }
        $query->with($with);

        $products = $query->get();

        return $products;
    }

    public function changeProductStatusOnSuccess($products){
        
        $products = json_decode(json_encode($products->collection));
        
        foreach($products as $product){
            $product = (array)$product;
            
            DB::table('products')->updateOrInsert(['id' => $product['id']] , ['sync_status'=>1]);
            // Product Variations
            
            foreach($product['product_variations'] as $product_variation){
                
                // Save Product Variations
                DB::table('product_variations')->updateOrInsert(
                    ['id' => $product_variation->id] , 
                    ['sync_status'=>1]
                );
                //Variations
                foreach($product_variation->variations as $variation){
                    
                    // Save Variations
                    DB::table('variations')->updateOrInsert(
                        ['id' => $variation->id],
                        ['sync_status'=>1]
                    );
                    // variation Location Details
                    foreach($variation->variation_location_details as $vld){
                        // Save variation_location_details
                        DB::table('variation_location_details')->updateOrInsert(['id' => $vld->id] ,  ['sync_status'=>1]);
                        
                        // Transactions
                        foreach($vld->transactions as $transaction){
                            
                            // Save Transactions
                            DB::table('transactions')->updateOrInsert(
                                ['id' => $transaction->id],
                                ['sync_status'=>1]
                            );
                            // Transaction Payments
                            foreach($transaction->transaction_payments as $transaction_payment){
                                if(!is_null($transaction_payment)){
                                    
                                    DB::table('transaction_payments')->updateOrInsert(
                                        ['id'=>$transaction_payment->id] ,
                                        ['sync_status'=>1]
                                    );
                                }
                            }
                            
                        }

                        // Purchase Lines
                        foreach($vld->purchase_lines as $pl){  
                            DB::table('purchase_lines')->updateOrInsert(
                                ['id'=>$pl->id],
                                ['sync_status'=>1]
                            );
                        }
                    }
                }


            }
        }
    }
    
}
