[< Go Back](../README.md)

# Display validation error

Most of the times the users should be able to see if they filled out a form wrong, and if so, why?
Well, we can tell them by displaying the error message given to us in $message by the form when it loads.

```php
<p class="text-red-500 text-xs mt-1">{{ $message }}</p>
```

And, to avoid having to repeat yourself filling out the form for every little error, we can use the 'old' version of every input.

`value="{{ old('name') }}"`

## Display them all at once

We can also use one foreach to display all the problems related to validation at one section of the page.

```php
@if ($errors->any())
    <ul>
        @foreach ($errors->all() as $error)
            <li class="text-red-500 text-sm">
                {{ $error }}
            </li>
        @endforeach
    </ul>
```

# Username already exists

There will be instances in which an user wants to register with the same username as another, which we cannot allow due to the 'unique' status of both the username and email columns.
To avoid this, we should tell them to look for the table users, the column username/email and see if it is, in fact, unique.

```php
$attributes = request()->validate([
    'name' => 'required|max:255',
    'username' => 'required|min:3|max:255|unique:users,username',
    'email' => 'required|email|max:255|unique:users,email',
    'password' => 'required|min:7|max:255',
]);
```