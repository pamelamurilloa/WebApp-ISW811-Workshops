[< Go Back](../README.md)

# Migrations

The migrations in the project are used to update the local environment to one that is up to date with all the people that are working with the project.

We can apply the changes by using...

```php
php artisan migrate
```

Or reverse them, like this:

```php
php artisan migrate:rollback
```

There's also a command useful for development but an absolute nightmare in production.

```php
php artisan migrate:rollback
```