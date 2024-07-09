[< Go Back](../README.md)

# Route Directory

## Web.php

Make a route, get the route in which to access it, and then call a function that returns a view to display, among whatever it need to do.

```php
    Route::get('/', function() {
        return view('welcome');
    });
```

# View Directory

## Welcome.blade.php

The views section is the one addresed through the router.

Every route should have a matching view for a functional page, but one can return any code.

