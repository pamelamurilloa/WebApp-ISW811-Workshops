[< Go Back](../README.md)

# Handleling the Request

If we go to the search we have in the header code, we can see it already submits a request when something is typed in, and includes that in the header.

So, if we can filter the posts according to the 'search' and the data it brings, we'll have a working searchbar.

To filter for an specific search, we can use a 'where' in the main router we have, this, to find everything that contains "search" somewhere in the title.

```php
Route::get('/', function () {

    $posts = Post::latest();

    if ( request('search') ) {
        $posts->where('title','like','%' . request('search') . '%');
    }
    
    return view('posts', [
        'posts' => $posts->get(),
        'categories' => Category::all()
    ]);
});
```

## Furthering the search options

If we also want to filter by information present in the description, or the body, we can simply use an or.

```php
Route::get('/', function () {

    $posts = Post::latest();

    if ( request('search') ) {
        $posts->where('title','like','%' . request('search') . '%')
        ->orWhere('body','like','%' . request('search') . '%');
    }
    
    return view('posts', [
        'posts' => $posts->get(),
        'categories' => Category::all()
    ]);
});
```

## Don't lose the query while searching

Knowing what you searched for is standard for a webpage with a good UX, to implement this in the code, we only need to add a `value` inside the searchbar. This will look for the value for search in the url everytime the page refreshes.

```php
value = "{{ request('search') }}">
```