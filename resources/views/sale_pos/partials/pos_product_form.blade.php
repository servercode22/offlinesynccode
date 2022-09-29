
    
    <div class="row" >
        <form action="{{route('pos.productposstore')}}" method="POST" id="save_product">
            {{-- {!! Form::open(['url' => action('SellPosController@productposstore'), 'method' => 'post', 'id' => 'add_pos_sell_form' ]) !!} --}}
            @csrf

                    <div class="col-sm-2">
                        <div class="form-group">
                            {!! Form::text('name', !empty($duplicate_product->name) ? $duplicate_product->name : null, ['class' => 'form-control', 'required',
                            'placeholder' => __('product.product_name')]); !!}                     
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="form-group">
                            {!! Form::number('qty_available',  null, ['class' => 'form-control', 'required',
                            'placeholder' => __('Quantity')]); !!}                     
                        </div>
                    </div>
                    <div class="col-sm-2">
                        {{--  --}}
                        <div class="form-group">
                            {!! Form::select('unit_id', $units, !empty($duplicate_product->unit_id) ? $duplicate_product->unit_id : session('business.default_unit'), ['class' => 'form-control select2', 'required']); !!}
                            
                        </div>
                        
                    </div>
                    <div class="col-sm-2">
                   
                        @include('product.partials.single_pos_hidden_tax', ['profit_percent' => $default_profit_percent])
                   
                    </div>
                    
                <div class="col-sm-4 hidden">
                    <div class="form-group hidden">
                    {!! Form::select('barcode_type', $barcode_types, !empty($duplicate_product->barcode_type) ? $duplicate_product->barcode_type : null, ['class' => 'form-control select2', 'required']); !!}
                    </div>
                </div>
                <div class="col-sm-4 hidden">
                    <div class="form-group">
                      {!! Form::label('sku', __('product.sku') . ':') !!} @show_tooltip(__('tooltip.sku'))
                      {!! Form::text('sku', null, ['class' => 'form-control',
                        'placeholder' => __('product.sku')]); !!}
                    </div>
                  </div>

                  <div class="col-sm-4 hidden @if(!session('business.enable_brand')) hide @endif">
                    <div class="form-group">
                      {!! Form::label('brand_id', __('product.brand') . ':') !!}
                      <div class="input-group">
                        {!! Form::select('brand_id', $brands, !empty($duplicate_product->brand_id) ? $duplicate_product->brand_id : null, ['placeholder' => __('messages.please_select'), 'class' => 'form-control select2']); !!}
                      <span class="input-group-btn">
                          <button type="button" @if(!auth()->user()->can('brand.create')) disabled @endif class="btn btn-default bg-white btn-flat btn-modal" data-href="{{action('BrandController@create', ['quick_add' => true])}}" title="@lang('brand.add_brand')" data-container=".view_modal"><i class="fa fa-plus-circle text-primary fa-lg"></i></button>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-4 hidden @if(!session('business.enable_category')) hide @endif">
                    <div class="form-group">
                      {!! Form::label('category_id', __('product.category') . ':') !!}
                        {!! Form::select('category_id', $categories, !empty($duplicate_product->category_id) ? $duplicate_product->category_id : null, ['placeholder' => __('messages.please_select'), 'class' => 'form-control select2']); !!}
                    </div>
                  </div>
                  <div class="col-sm-4 hidden @if(!(session('business.enable_category') && session('business.enable_sub_category'))) hide @endif">
                    <div class="form-group">
                      {!! Form::label('sub_category_id', __('product.sub_category') . ':') !!}
                        {!! Form::select('sub_category_id', $sub_categories, !empty($duplicate_product->sub_category_id) ? $duplicate_product->sub_category_id : null, ['placeholder' => __('messages.please_select'), 'class' => 'form-control select2']); !!}
                    </div>
                  </div>
      
        
            @php
              $default_location = null;
              if(count($business_locations) == 1){
                $default_location = array_key_first($business_locations->toArray());
              }
            @endphp
             
            <div class="col-sm-4 hidden">
              <div class="form-group ">
                  {!! Form::select('product_locations[]', $business_locations, $default_location, ['class' => ' select2', 'multiple', 'id' => 'product_locations','hidden']); !!}
              </div>
            </div>
    
            <div class="col-sm-4 hidden @if(!empty($duplicate_product) && $duplicate_product->enable_stock == 0) hide @endif" id="alert_quantity_div">
                <div class="form-group">
                  {!! Form::label('alert_quantity',  __('product.alert_quantity') . ':') !!} @show_tooltip(__('tooltip.alert_quantity'))
                  {!! Form::text('alert_quantity', !empty($duplicate_product->alert_quantity) ? @format_quantity($duplicate_product->alert_quantity) : null , ['class' => 'form-control input_number',
                  'placeholder' => __('product.alert_quantity'), 'min' => '0']); !!}
                </div>
              </div> 
            
           
            <div class="col-sm-4 hidden">
              <div class="form-group">
                  {!! Form::checkbox('enable_stock', 0, !empty($duplicate_product) ? $duplicate_product->enable_stock : true, ['class' => 'input-icheck', 'id' => 'enable_stock','hidden']); !!} 
              </div>
            </div>

           
                <div class="col-sm-4 hidden @if(!session('business.enable_price_tax')) hide @endif">
                  <div class="form-group">
                      {!! Form::select('tax', $taxese, !empty($duplicate_product->tax) ? $duplicate_product->tax : null, ['placeholder' => __('messages.please_select'), 'class' => ' select2','hidden'], $tax_attributes); !!}
                  </div>
                </div>
                
                <div class="col-sm-4 hidden   @if(!session('business.enable_price_tax')) hide @endif">
                  <div class="form-group">
                      {!! Form::select('tax_type', ['inclusive' => __('product.inclusive'), 'exclusive' => __('product.exclusive')], !empty($duplicate_product->tax_type) ? $duplicate_product->tax_type : 'exclusive',
                      ['class' => ' select2', 'required','hidden']); !!}
                  </div>
                </div>
                
                
        
                <div class="col-sm-4 hidden">
                  <div class="form-group">
                   @show_tooltip(__('tooltip.product_type'))
                    {!! Form::select('type', $product_types, !empty($duplicate_product->type) ? $duplicate_product->type : null, ['class' => ' select2','hidden',
                    'required', 'data-action' => !empty($duplicate_product) ? 'duplicate' : 'add', 'data-product_id' => !empty($duplicate_product) ? $duplicate_product->id : '0']); !!}
                  </div>
                </div>
               
                <input type="hidden" id="variation_counter" value="1">
                <input type="hidden" id="default_profit_percent" 
                  value="{{ $default_profit_percent }}">

                  
        <div class="col-sm-4 hidden">
            <div class="form-group">
              {!! Form::label('weight',  __('lang_v1.weight') . ':') !!}
              {!! Form::text('weight', !empty($duplicate_product->weight) ? $duplicate_product->weight : null, ['class' => 'form-control', 'placeholder' => __('lang_v1.weight')]); !!}
            </div>
          </div> 
          @php
          $custom_labels = json_decode(session('business.custom_labels'), true);
          $product_custom_field1 = !empty($custom_labels['product']['custom_field_1']) ? $custom_labels['product']['custom_field_1'] : __('lang_v1.product_custom_field1');
          $product_custom_field2 = !empty($custom_labels['product']['custom_field_2']) ? $custom_labels['product']['custom_field_2'] : __('lang_v1.product_custom_field2');
          $product_custom_field3 = !empty($custom_labels['product']['custom_field_3']) ? $custom_labels['product']['custom_field_3'] : __('lang_v1.product_custom_field3');
          $product_custom_field4 = !empty($custom_labels['product']['custom_field_4']) ? $custom_labels['product']['custom_field_4'] : __('lang_v1.product_custom_field4');
        @endphp
        <div class="hidden">
            <div class="col-sm-3">
                <div class="form-group">
                  {!! Form::label('product_custom_field1',  $product_custom_field1 . ':') !!}
                  {!! Form::text('product_custom_field1', !empty($duplicate_product->product_custom_field1) ? $duplicate_product->product_custom_field1 : null, ['class' => 'form-control', 'placeholder' => $product_custom_field1]); !!}
                </div>
              </div>
      
              <div class="col-sm-3">
                <div class="form-group">
                  {!! Form::label('product_custom_field2',  $product_custom_field2 . ':') !!}
                  {!! Form::text('product_custom_field2', !empty($duplicate_product->product_custom_field2) ? $duplicate_product->product_custom_field2 : null, ['class' => 'form-control', 'placeholder' => $product_custom_field2]); !!}
                </div>
              </div>
      
              <div class="col-sm-3">
                <div class="form-group">
                  {!! Form::label('product_custom_field3',  $product_custom_field3 . ':') !!}
                  {!! Form::text('product_custom_field3', !empty($duplicate_product->product_custom_field3) ? $duplicate_product->product_custom_field3 : null, ['class' => 'form-control', 'placeholder' => $product_custom_field3]); !!}
                </div>
              </div>
      
              <div class="col-sm-3">
                <div class="form-group">
                  {!! Form::label('product_custom_field4',  $product_custom_field4 . ':') !!}
                  {!! Form::text('product_custom_field4', !empty($duplicate_product->product_custom_field4) ? $duplicate_product->product_custom_field4 : null, ['class' => 'form-control', 'placeholder' => $product_custom_field4]); !!}
                </div>
              </div>
          </div>
        
              <div class="col-md-3 ">
                  <input type="submit" class="btn-danger" name="submit_type"id="product_save" >
              </div> 
    </div>
</form>




