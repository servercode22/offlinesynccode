@extends('layouts.app')
@section('title',  __('cash_register.open_cash_register'))

@section('content')
<style type="text/css">



</style>
<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="row">
    <div class="col-md-6">
      <h1>@lang('cash_register.open_cash_register')</h1>
    </div>
  </div>
    <!-- <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
    </ol> -->
</section>

<!-- Main content -->
<section class="content">
{!! Form::open(['url' => action('CashRegisterController@store'), 'method' => 'post', 
'id' => 'add_cash_register_form' ]) !!}
  <div class="box box-solid">
    <div class="box-body">
      <div class="row">
        <div class="col-md-12">
          <div class="message">
            @if (\Session::has('product-message'))
            <div class="alert alert-success">
                <ul>
                    <li>{!! \Session::get('product-message') !!}</li>
                </ul>
            </div>
            @elseif(\Session::has('product-error'))
            <div class="alert alert-error">
              <ul>
                  <li>{!! \Session::get('product-error') !!}</li>
              </ul>
          </div>
          @elseif(\Session::has('sales-sync-error'))
            <div class="alert alert-error">
              <ul>
                  <li>{!! \Session::get('sales-sync-error') !!}</li>
              </ul>
          </div>
          @elseif(\Session::has('sales-sync-success'))
            <div class="alert alert-success">
              <ul>
                  <li>{!! \Session::get('sales-sync-success') !!}</li>
              </ul>
          </div>
            @endif
          </div>
        </div>
      </div>
    <div class="row">
      <div class="col-md-6">
        <a href="{{action('SyncApiController@getLiveProductsData')}}" class="btn btn-success">Get Products and Data</a>
      </div>
      <div class="col-md-6 text-right">
        <a href="{{action('Auth\LoginController@logout')}}" class="btn btn-warning">SignOut</a>
      </div>
    </div>
    <br><br><br>
    <input type="hidden" name="sub_type" value="{{$sub_type}}">
      <div class="row">
        @if($business_locations->count() > 0)
        <div class="col-sm-8 col-sm-offset-2">
          <div class="form-group">
            {!! Form::label('amount', __('cash_register.cash_in_hand') . ':*') !!}
            {!! Form::text('amount', null, ['class' => 'form-control input_number',
              'placeholder' => __('cash_register.enter_amount'), 'required']); !!}
          </div>
        </div>
        @if(count($business_locations) > 1)
        <div class="clearfix"></div>
        <div class="col-sm-8 col-sm-offset-2">
          <div class="form-group">
            {!! Form::label('location_id', __('business.business_location') . ':') !!}
              {!! Form::select('location_id', $business_locations, null, ['class' => 'form-control select2',
              'placeholder' => __('lang_v1.select_location')]); !!}
          </div>
        </div>
        @else
          {!! Form::hidden('location_id', array_key_first($business_locations->toArray()) ); !!}
        @endif
        <div class="col-sm-8 col-sm-offset-2">
          <button type="submit" class="btn btn-primary pull-right">@lang('cash_register.open_register')</button>
        </div>
        @else
        <div class="col-sm-8 col-sm-offset-2 text-center">
          <h3>@lang('lang_v1.no_location_access_found')</h3>
        </div>
      @endif
      </div>
      <br><br><br>
    <div class="row">
      <div class="col-md-6">
        <a href="{{route('business.getRegister')}}" class="btn btn-info">Get Users (PIN Validation)</a>
        
      </div>
      <div class="col-md-6 text-right">
        {{-- <a href="{{action('SyncController@syncSellPosSaleModuleOnly')}}" class="btn btn-warning">Sync Sales</a> --}}
        
        <a href="{{action('SyncApiController@syncSale')}}" class="btn btn-warning">Sync Sales</a>
      </div>
    </div>
    </div>
  </div>
  {!! Form::close() !!}
</section>
<!-- /.content -->
@endsection