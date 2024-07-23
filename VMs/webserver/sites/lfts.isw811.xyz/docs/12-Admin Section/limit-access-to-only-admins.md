[< Go Back](../README.md)

# Create a new _Create_ Section

As admins, we want to be able to create posts as we please, to do this, we need a form of course, and the corresponding logic that comes with that.

In the first place, we'll make a route for the form.

`Route::get('/admin/posts/create', [PostController::class, 'create']);`

And the method called in PostController, that also verifies if the username of the person logged in (if there is a person logged in) correspond to the admin one.

```php
public function create()
{
    if (auth()->user()?->username === 'Pamela') {
        abort(Response::HTTP_FORBIDDEN);
    }

    return view('posts.create');
}
```

But there is a better way to do this...

# Auth using Middlewares

To make a middleware, we can use the following command: `php artisan make:middleware MustBeAdministrator`.

This will allow us to copy and paste the code we made into this new middleware.

```php
public function handle(Request $request, Closure $next)
{
    if (auth()->user()?->username === 'Pamela') {
        abort(Response::HTTP_FORBIDDEN);
    }
    
    return $next($request);
}
```

We can make page specific middlewares in our Kernel file: `'admin' => MustBeAdministrator::class,`

Finally, we add the middleware to the route.

`Route::get('/admin/posts/create', [PostController::class, 'create'])->middleware('admin');`