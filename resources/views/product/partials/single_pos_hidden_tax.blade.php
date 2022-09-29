@if(!session('business.enable_price_tax')) 
  @php
    $default = 0;
    $class = 'hide';
  @endphp
@else
  @php
    $default = null;
    $class = '';
  @endphp
@endif


       
        
            <div class="form-group col-sm-12">

            {!! Form::text('single_dpp_inc_tax', $default, ['class' => 'form-control input-sm dpp_inc_tax input_number ', 'placeholder' => __('P.P')]); !!}
            
          
            {!! Form::text('single_dpp', $default, ['class' => 'form-control input-sm dpp input_number', 'placeholder' => __('S.P'), 'required']); !!}
              
            
            
              

             <div class="hidden">
       
            {!! Form::text('profit_percent', @num_format($profit_percent), ['class' => 'form-control input-sm input_number', 'id' => 'profit_percent']); !!}
       
             </div> 
        </div>
       
          @if(empty($quick_add))
         
              <div class="form-group hidden">
           
                {!! Form::file('variation_images[]', ['class' => 'variation_images','hidden', 'accept' => 'image/*', 'multiple']); !!}
               
              </div>
         
          @endif
      
