[< Go Back](../README.md)

# N+1 problem

In posts, we are inside a loop that tries to access a relationship thats hasnt been yet loaded, adding an additional sql query for every item in the loop.

## Clockwork

Clockwork can be added to a browser to deeply debug this kinda things.

To fix the n+ problem, we must wait for the; in this case; category to load, like this:

```php
Route::get('/', function () {
    return view('posts', [
        'posts' => Post::with('category')->get()
    ]);
});
```

