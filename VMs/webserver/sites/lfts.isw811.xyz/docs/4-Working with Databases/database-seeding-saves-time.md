[< Go Back](../README.md)

# Add an Author

There is already a users table, so we only have to connect post and user with a foreign key `$table->foreignId('user_id');` in the migration of posts.

# Altering Migration

Also, as to avoid duplicates while seeding, we should include a `unique` attribute to both name and slug in the categories migration.

# Seeding

In the DatabaseSeeder file we can add a few lines of code to automatically fill up the tables. This is indispensable in development stages.

```php
$user = User::factory()->create();

Category::create([
    'name'=>'Personal',
    'slug'=>'personal'
]);
```

To update all of this migrations and seed at the same time, we use the command

```bash
php artisan migrate:refresh --seed
```
![browser image](./images/image07.png)

We then create the same seeder for the posts and remember to truncate all tables as to avoid errors.

![browser image](./images/image08.png)

# Author - Post relatinoship

We must do the same thing with did with categories and posts.
In the Post model, we include:

```php
public function user() {
    return $this->belongsTo(User::class);
}
```

And in the User model, we write:

```php
public function posts() {
    return $this->hasMany(Post::class);
}
```

All that's left to do is write the corresponding `By <a href="#">{{ $post->user->name}}</a> in <a href="/categories/{{ $post->category->slug}}">{{ $post->category->name }}</a>` in the post view.