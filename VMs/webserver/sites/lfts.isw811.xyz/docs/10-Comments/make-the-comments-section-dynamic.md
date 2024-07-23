[< Go Back](../README.md)

# Create a New Post and User

To use the factory effectively we should create a post and a user when creating comments with it, just like this:

```php
return [
    'post_id' => Post::factory(),
    'user_id' => User::factory(),
    'body' => $this->faker->paragraph()
];
```

# Make Relations

We can make the needed connections between models with the belongsTo we've been using in the other models. In this case, we'll add the following code to the Comment model.

```php
public function post()
{
    return $this->belongsTo(Post::class);
}

public function author()
{
    return $this->belongsTo(User::class, 'user_id');
}
```

# Dinamicaly Display Comments

We already have a comment component, but to make it dynamic we need to send it props `@props(['comment'])` and then display each of the sections, like the author, the date and the comment.

To display the comments, we use a simple foreach.

```php
    @foreach ($post->comments as $comment)
        <x-post-comment :comment="$comment" />
    @endforeach
```