[< Go Back](../README.md)

# Login and Logout

# Login and auth

Right now we have the register page but no access to it, so that will be our first priority, as shown by the `<a href="/register" class="text-xs font-bold uppercase">Register</a>` code we have here. Related to this, we need a place to log in, in case the user has already registered `<a href="/login" class="ml-6 text-xs font-bold uppercase">Log In</a>`.

Furthermore, we need to differenciate between a logged in user and one that hasn't logged in yet, we do this by using the 'auth' methods we have on hand. This leaves us with a code in the layout that looks like this:

```php
@auth
    <span class="text-xs font-bold uppercase">Welcome, {{ auth()->user()->name }}!</span>

    <form method="POST" action="/logout" class="text-xs font-semibold text-blue-500 ml-6">
        @csrf

        <button type="submit">Log Out</button>
    </form>
@else
    <a href="/register" class="text-xs font-bold uppercase">Register</a>
    <a href="/login" class="ml-6 text-xs font-bold uppercase">Log In</a>
@endauth
```

PD. There will be an error as the page tries to redirect us to '/home', to fix that, we go into the RouteServiceProvider.php and change line 20

```php
public const HOME = '/';
```

For this code to work we need a couple things apart from that

1. __Middlewears__: A middlewear in this case, can be described as a method or function that triggers in a redirect, in this case, we'll add the middlewear 'guest' to our register routes, to make them dissapear for logged in users.

```php
Route::get('uregister', [UregisterController::class, 'create'])->middleware('guest');
Route::post('uregister', [UregisterController::class, 'store'])->middleware('guest');
```

2. __Sessions Controller__: A session controller will allow us to manage all things related to a session, like the logout.

```bash
artisan make:controller SessionsController
```

## Logout

We will use this new controller we made to habilitate that logout part we had back there.

```php
Route::post('logout', [SessionsController::class, 'destroy']);
```

```php
public function destroy()
{
    auth()->logout();

    return redirect('/')->with('success', 'Goodbye!');
}
```

And just like that, we have a login and a logout.