[< Go Back](../README.md)

# Password hashing

To hash a password we have 2 ways: the first one is to change it in the register controller before creating it,

```php
$attributes['password'] = bcrypt($attributes['password']);
```

the second way, is to automatically hash the password wherever it is set. This is done in the User model and it's called mutating values.

```php
public function setPasswordAttribute() {
        $this->attributes['password'] = bcrypt($password);
    }
```