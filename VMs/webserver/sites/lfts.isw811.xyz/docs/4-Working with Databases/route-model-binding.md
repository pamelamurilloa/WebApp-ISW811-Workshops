[< Go Back](../README.md)

# Route model binding

The route model binding explains the act of binding a route key to an underlined eloquent model. For this to work there must be a couple things. But...

__The route and the model must match__

```php
Route::get('posts/{post}', function (Post $post ) {
    return view('post', [
        'post' => $post
    ]);
});
```

We can also do this with a slug or any other atribute. To do this, the code is slightly different.

```php
Route::get('posts/{post:slug}', function (Post $post ) {
    return view('post', [
        'post' => $post
    ]);
});
```

If you wanna identify by the slug, and have the slug in the url like in this case, but dont wanna have it there, you can always add this function to the Post Model.

```php
public function getRouteKeyName() {
    return 'slug';
}
```