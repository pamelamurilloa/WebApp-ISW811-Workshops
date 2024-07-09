[< Go Back](../README.md)

# Login page

To create a login page, it's neccessary to make the apropiate routing. In this case, we can make a route for the login, one for the submission of the form and, as an extra, add a middleware to the logout we had.

```php
Route::get('login', [SessionsController::class, 'create'])->middleware('guest');
Route::post('login', [SessionsController::class, 'store'])->middleware('guest');

Route::post('logout', [SessionsController::class, 'destroy'])->middleware('auth');
```

Now that we have the routes ready, we can begin to code the functions they're supposed to be calling, like create and store.

```php
public function create()
{
    return view('sessions.create');
}

public function store()
{
    $attributes = request()->validate([
        'email' => 'required|exists:users,email',
        'password' => 'required'
    ]);

    if (auth()->attempt($attributes)) {
        session()->regenerate();

        return redirect('/')->with('success', 'Welcome Back!');
    }

    throw ValidationException::withMessages([
        'email' => 'Your provided credentials could not be verified.'
    ]);
}
```

In the store function, we are validating both the email and the password. If the validation goes alright, the person is sent to the main page, if not, then an error message is provided.

## Login view

Of course, all these routes have to be referencing an actual view in which an user can login. Two inputs and a button are more than enough to do the job.

## Successful login

![browser image](./images/image03.png)

## Successful logout

![browser image](./images/image04.png)