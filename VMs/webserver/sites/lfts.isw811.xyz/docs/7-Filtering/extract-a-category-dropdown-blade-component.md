[< Go Back](../README.md)

# Extracting Categories

Categories is only needed in the dropdown component, so we can isolate it by making a CategoryDropdown in our vagrant terminal.

```bash
php artisan make:component CategoryDropdown
```

In here, we can have our categories and our current category in an coordinated manner.

```php
public function render()
{
        return view('components.category-dropdown', [
            'categories' => Category::all(),
            'currentCategory' => Category::firstWhere('slug', request('category'))
        ]);
}
```

This, of course, will allow us to erase from both the Post Controller and the routes anything related to categories.

# Naming Conventions

It's important to maintain a certain order while making our files, folders and functions. This means applying the correct naming conventions we have, like so, in the case of PostController:

```php
public function index()
{
    $posts = Post::latest();

    return view('posts.index', [
        'posts' => Post::latest()->filter(request(['search', 'category']))->get()
    ]);
}

public function show(Post $post) {
    return view('post.show', [
        'post' => $post
    ]);
}
```

The name of the view should match the file, of course.