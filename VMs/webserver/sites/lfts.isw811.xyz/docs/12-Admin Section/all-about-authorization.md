[< Go Back](../README.md)

# Selective Dropdown

There are certain things that normal users shouldn't be able to see, like the admin dropdown with the dashboard options.

To avoid them seeing it the only thing we have is the middleware, but the middleware doesn't discriminate enough as to keep or delete html, so we will need something else.

This particular thing is called a gate, and it goes right in our AppServiceProvider as this:

```php
Gate::define('admin', function (User $user) {
            return $user->username === 'Pamela';
        });
```

We can corroborate this is working by asking `Gate::allows('admin')` and it should return a true if, well... true. Also a false if not, hope that helps.

# Discriminate Against Non Admins

To restrict the views of the ~~unworthy~~ normal users, we can use a classic if, use @can('admin) and @endcan _or_ we can wrap our code into a personalized code: `@admin`

```php
@admin
    <x-dropdown-item href="/admin/posts" :active="request()->is('admin/posts')">Dashboard</x-dropdown-item>
    <x-dropdown-item href="/admin/posts/create" :active="request()->is('admin/posts/create')">New Post</x-dropdown-item>
@endadmin
```

Now, in our AppServiceProvider, under the Gate, we can ask for an admin status.

```php
Blade::if('admin', function () {
    return request()->user()?->can('admin');
});
```

With that resolved, our previous middleware is not really a necessity, so we can just delete that and use the can already in our Kernel for our routes:

```php
Route::middleware('can:admin')->group(function () {
    Route::resource('admin/posts', AdminPostController::class)->except('show');
});
```

Apart from that, you can notice it's a bit different than before. That's because we can group them all into one, apply that middleware to the one and avoid a bunch of code.

Furthermore, because we're using the 6 of the 7 REST actions in our code, we can use the help of our environment and make them automatically, except for the one we don't have, 'show'.