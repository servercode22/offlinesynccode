
<h3 class="text-center" style="margin-top: 0px">
    KOT
</h3>

<h5 class="text-center">Customer:{{$receipt_details->customer_name}}</h5>

<h5 class="text-center">Date:{{$receipt_details->invoice_date}}</h5>
<h5 class="text-center">	Invoice_No:{{$receipt_details->invoice_no}}</h5>
        <!-- Table information-->
        @if(!empty($receipt_details->table_label) || !empty($receipt_details->table))
        
            
                @if(!empty($receipt_details->table_label))
                <h5 class="text-center">
                {!! $receipt_details->table_label !!}
                @endif
                {{$receipt_details->table}}

                <!-- Waiter info -->
            </h5>		        @endif
<h5 class="text-center">
    @if (!empty($receipt_details->types_of_service))
       Types Of Service: {{$receipt_details->types_of_service}}
    @endif
</h5>
<div style="margin:2%">
    <hr>
<table class="table table-responsive  table-striped ">


    <thead>
      <tr>
        <th scope="rowspan"><input  checked="true"  class="kot_item_checkbox" id="products_check" type="checkbox" ></th>
            <th scope="col">{{$receipt_details->table_product_label}}</th>
            <th scope="col">{{$receipt_details->table_qty_label}}</th>

        </tr>					
    </thead>
    <tbody id="ye">
        @forelse($receipt_details->lines as $line)
        @if(isset($h2))
            <tr>
              
                <td >
                
                    {{$line['name']}} 
               
                
                </td>
                <td >{{$h2}} {{$line['units']}} </td>
        
            </tr>
        @else
            <tr>
               <td><input checked="" class="custom_name" id="kot_item_checkbox_269" type="checkbox"   ></td> 
                <td >
                    {{$line['name']}} {{$line['product_variation']}} {{$line['variation']}} 
                    @if(!empty($line['sub_sku'])), {{$line['sub_sku']}} @endif @if(!empty($line['brand'])), {{$line['brand']}} @endif @if(!empty($line['cat_code'])), {{$line['cat_code']}}@endif
                    @if(!empty($line['product_custom_fields'])), {{$line['product_custom_fields']}} @endif
                    @if(!empty($line['modifiers']))
                    <br> 
                    @foreach($line['modifiers'] as $modifier)    
                    <small>{{$modifier['variation']}},</small>   
                   @endforeach
                @endif
                    @if(!empty($kot_desc))
                    <br>
                 
                    <small>
                        {{$kot_desc}}
                    </small>
                    @endif 
                </td>
                <td >{{$line['quantity']}} {{$line['units']}} </td>
            </tr>
          
        @endif


        @empty
            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>
        @endforelse
    </tbody>
</table>
</div>
<script>
        $('#products_check').on('click',function(){
			
            var checkAll = this.checked;
            $(".custom_name").each(function(){
            // $(this).attr("checked", true);
            
            this.checked=checkAll;
});
            
    });


</script>