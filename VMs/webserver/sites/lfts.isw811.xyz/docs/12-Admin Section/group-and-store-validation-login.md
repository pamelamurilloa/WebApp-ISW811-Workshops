[< Go Back](../README.md)

# Avoid Duplication

As a rule of thumb, it's best to avoid duplication, but nt at the expense of readability. In our adminPostController case we could just leave it like that, but to avoid repeating all the rules we can make a couple touch ups.

Both our validations are pretty much the same, so the only thing we have to do is find a common ground that works for both and extract that. We'll call this validatePost

```php
protected function validatePost(?Post $post = null): array
    {
        $post ??= new Post();

        return request()->validate([
            'title' => 'required',
            'thumbnail' => $post->exists ? ['image'] : ['required', 'image'],
            'slug' => ['required', Rule::unique('posts', 'slug')->ignore($post)],
            'excerpt' => 'required',
            'body' => 'required',
            'category_id' => ['required', Rule::exists('categories', 'id')],
            'published_at' => 'required'
        ]);
    }
```

And we can use this in our store function, for example.

```php
public function store()
    {
        Post::create(array_merge($this->validatePost(), [
            'user_id' => request()->user()->id,
            'thumbnail' => request()->file('thumbnail')->store('thumbnails')
        ]));

        return redirect('/');
    }
```