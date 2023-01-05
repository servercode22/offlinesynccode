@if(empty($is_admin))
    {{-- <h3>@lang('business.business')</h3> --}}
@endif
{!! Form::hidden('language', request()->lang); !!}
<br>
<legend class="text-center">@lang('business.key_credentials')</legend>
<br>
<fieldset class="register_card">
    @if (count($errors) > 0)
         <div class = "alert alert-danger">
            <ul>
               @foreach ($errors->all() as $error)
                  <li>{{ $error }}</li>
               @endforeach
            </ul>
         </div>
      @endif
      @if (\Session::has('error'))
    <div class="alert alert-error">
        <ul>
            <li>{!! \Session::get('error') !!}</li>
        </ul>
    </div>
@endif
<br><br>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
<div class="card">
    <div class="card-body">
     <div class="row">
         <div class="col-md-12">
            <label for="">Business Pin:<sup>*</sup></label><br><br>
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-key"></i>
                </span>
                {!! Form::text('business_pin', null, ['class' => 'form-control','placeholder' => __('Example: AAA-1234567'), 'required']); !!}
            </div>
         </div>
     </div><br>
     <div class="row">
        <div class="col-md-12">
           <label for="">Location Pin:<sup>*</sup></label><br><br>
           <div class="input-group">
               <span class="input-group-addon">
                   <i class="fa fa-key"></i>
               </span>
               {!! Form::text('location_pin', null, ['class' => 'form-control','placeholder' => __('Example: AAA-1234567'), 'required']); !!}
           </div>
        </div>
    </div>
     <br>
      <button type="submit" class="btn btn-primary" style="margin-bottom: 15px; float:right">Submit</button>
    </div>
  </div>
</div>
  <div class="col-md-3"></div>
</div>
</fieldset>