[< Go Back](../README.md)

# Combine Migration and Model

To create both a migration and a model in the same line, we must use the code:

```bash
php artisan make:model Category -m
```

In this case, we're creating `Category` and their corresponding migration.

We must remember to continuously refresh the migrations if we make changes to them.

![browser image](./images/image04.png)

# Eloquent relationships

When the information of a table is access through another by asking only for the key, that is a eloquent relationship.

There are a lot of different types of relationships we can choose from, but for now, the one that is the most adequate is this one:

```php
public function category() {
    return $this->belongsTo(Category::class);
}
```
Inserted in the Post model.

## How does that look like?

![browser image](./images/image05.png)
