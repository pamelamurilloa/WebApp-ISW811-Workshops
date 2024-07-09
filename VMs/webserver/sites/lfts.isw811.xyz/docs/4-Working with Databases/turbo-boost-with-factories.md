[< Go Back](../README.md)

# Creating a factory

Factories are very useful when you need to get a dataset as close to production as possible, generating random names, emails, numbers and anddreses

We can create a factory, a model, a controller and a migration all in one swing.
For now, we can just use `php artisan make:factory PostFactory`

We define the things we want in the post data

```php
return [
    'user_id' => User::factory(),
    'category_id' => Category::factory(),
    'title' => $this->faker->sentence,
    'slug' => $this->faker->slug,
    'excerpt' => $this->faker->sentence,
    'body' => $this->faker->paragraph,
];
```

Same thing with Categories and then we can just seed our database with this in the DatabaseSeeder:

```php
    Post::factory()->create();
```

![browser image](./images/image09.png)
