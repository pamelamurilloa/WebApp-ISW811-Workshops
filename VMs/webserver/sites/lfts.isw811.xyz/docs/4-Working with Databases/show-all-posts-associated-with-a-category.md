[< Go Back](../README.md)

To get the posts by category we can refactorize a lot of code. Like this, using category to call for posts.

```php
Route::get('categories/{category}', function (Category $category ) {
    return view('posts', [
        'posts' => $category->posts
    ]);
});
```

For this to work though, we'll have to add a new function to the Category model. What does a category have? Many posts, so, it goes like this:

```php
public function posts() {
    return $this->hasMany(Post::class);
}
```

To get the post by the slug, we must only change it on web.php, specifying `{category:slug}`, and in the href of the post and posts views.

![browser image](./images/image06.png)