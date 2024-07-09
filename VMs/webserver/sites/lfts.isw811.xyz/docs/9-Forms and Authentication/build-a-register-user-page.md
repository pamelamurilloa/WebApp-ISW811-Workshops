[< Go Back](../README.md)

# Creating a RegisterController

Laravel has all kinds of good stuff to simplify the coding process, but, to make it manually one can start by building a RegisterController with its corresponding view.

```php
Route::get('register', (RegisterController::class, 'create'));
```

```bash
php artisan make:controller RegisterController
```

Inside of the Controller created, we sall return a view, in this case we're gonna make a form, so the view is 'create.blade.php' inside of the folder 'register' in views.

```php
public function create() {
    return view('register.create')
}
```

Now, we can use a shortcut or type manually the types of inputs that we want, regardless of the way, they should look something like this:

```php
<div class="mb-6">
    <label class="block mb-2 uppercase font-bold text-xs text-gray-700"
            for="username"
    >
        Username
    </label>

    <input class="border border-gray-400 p-2 w-full"
            type="text"
            name="username"
            id="username"
            required
    >
</div>
```

Inside of a form, inside of a section, inside of a component, which in this case is layout. This form should have every field required in the User migration.

To habilitate the submit button, because the form is of type POST, we shall make a route for that and the corresponding function in the RegisterController.

```php
Route::post('register', [RegisterController::class, 'store']);
```

```php
public function store() {
    $attributes = request()->validate([
        'name' => 'required|max:255',
        'username' => 'required|min:3|max:255',
        'email' => 'required|email|max:255',
        'password' => 'required|min:7|max:255',
    ]);

    User::create($attributes);

    return redirect('/');
}
```

If the attributes are not validated, the page is inmediately refreshed.
For this to work though, username should be included in the $fillable space in our Model or by excluding everything from the guarded array.

```php
protected $guarded = [];
```

## Evading Error 419 

To add validation to our form submission, we have to add `@csrf` at the start of our form.