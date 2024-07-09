[< Go Back](../README.md)

# Eloquent

Laravel uses a standarized way to connect the Model in the project with the database. In the DB, the object is un plural and its matching pair is in singular, like 'users' and 'User'. This is called Active Record Pattern.

We can create an user in the console with php artisan tinker.

```php
php artisan tinker
$user = new App\Models\User;
$user->name = 'Pamela';
$user->email = 'pam@gmail.com';
$user->password = bcrypt('123');
$user->save();
```

We can also see the user with:

```php
$users->first()
$users[1]
```

And many others...

