[< Go Back](../README.md)

# Layout

We can create a layout that can serve as a wraping for a lot of different pages that contain similar components, like a footer or header.
This is done in the folder 'views'

This layout will '@yield('name-of-section')' in any part of the code and how many times we want.

In the child-views, we simply declare it `@extends('layout)` or whatever the name of the layout is, and then start `@section('name-of-section)` the section, write the html and php we want and then close it `@endsection`

# Components

Another way to do this is to create that layout in a 'components' folder inside view. Each of their children will start and end with a <x-layout> tag and in the layout, a {{ $slot }} or another variable if the need is something more specific.