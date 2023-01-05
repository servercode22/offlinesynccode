@extends('layouts.home')
@section('title', config('app.name', 'ultimatePOS'))

@section('content')
    <style type="text/css">
        .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
                margin-top: 3%;
            }
        .title {
                font-size: 84px;
                font-family: "Georgia", Times, serif;
            }
        .tagline {
                font-size:25px;
                font-weight: 300;
                text-align: center;
            }

        @media only screen and (max-width: 600px) {
            .title{
                font-size: 38px;
            }
            .tagline {
                font-size:18px;
            }
        }
    </style>
    <div class="title flex-center" style="font-weight: 400 !important;">
        {{ config('app.name', 'ultimatePOS') }}
    </div>
    <p class="tagline">
        {{ env('APP_TITLE', '') }}
    </p>
@endsection
            