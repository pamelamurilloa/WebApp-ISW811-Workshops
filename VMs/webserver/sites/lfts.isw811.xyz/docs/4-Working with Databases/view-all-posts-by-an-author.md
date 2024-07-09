[< Go Back](../README.md)

# Order by

We can add a 'latest' to indicate order by

```php
Route::get('/', function () {
    return view('posts', [
        'posts' => Post::latest()->with('category', 'author')->get()
    ]);
});
```

The 'author' part is so it doesn't load multiple times.

# Author vs User

User isn't exactly descriptive, so we could change it in the post view, the relationship in the post model and add a second clause to avoid confusion in the program:

```php
public function author() {
    return $this->belongsTo(User::class, 'user_id');
}
```

# Routing

If we want to see the posts of a specific author, we must introduce a new route in the web.php file, like so

```php
Route::get('authors/{author}', function (User $author ) {
    return view('posts', [
        'posts' => $category->posts
    ]);
});
```

And change the href in the posts files, like this:

```php
By <a href="/authors/{{ $post->author-id }}">{{ $post->author->name}}</a> in <a href="/categories/{{ $post->category->slug}}">{{ $post->category->name }}</a>
```
Still, to improve upon this we can use the username instead of the id. For that, it's as simple as including a unique username in the migration for users table and updating it in the seeders too.