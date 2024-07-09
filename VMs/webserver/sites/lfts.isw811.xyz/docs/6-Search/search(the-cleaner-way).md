[< Go Back](../README.md)

# Controllers

To separate random code from the routes, we should have a controller to control specific parts of a Model, like the search bar for the posts. So, we make a PostController from the terminal connected to the VM.

```bash
php artisan make:controller PostController
```
Now, we can integrate the exact same code we had inside of route, as an action in the PostController.

## Using controllers from the routes

We can activate a controller's action by providing the full path to the controller and then the controller action we want to trigger.

```php
Route::get('/', [PostController::class, 'index']);
```

The same thing can be done to the show post route we had, copying the code and pasting it inside an action of the controller called 'show'.

```php
Route::get('posts/{post:slug}', [PostController::class, 'show']);
```

## Query scopes

We can create our own intelligent query scopes in our eloquent models to be able to do something like this in our Controller:

```php
    public function index()
    {
        $posts = Post::latest();

        return view('posts', [
            'posts' => Post::latest()->filter()->get(),
            'categories' => Category::all()
        ]);
    }
```

Notice the `Post::latest()->filter()->get(),`, this will allow us to keep the code clean.

Of course, the scope has to be constructed somewhere, and that somewhere is the model.

```php
public function scopeFilter($query) {
    if ( request('search') ) {
        $query
            ->where('title','like','%' . request('search') . '%')
            ->orWhere('body','like','%' . request('search') . '%');
    }
}
```

## To each their own

The thing is, knowing what the specific name of the request is called, is not the Post's problem, so we can change it up a bit to be able to accept whichever filter comes their way by adding an array and taking it from there.

In the PostController:
```php
public function index()
{
    $posts = Post::latest();

    return view('posts', [
        'posts' => Post::latest()->filter(request(['search']))->get(),
        'categories' => Category::all()
    ]);
}
```

In the Post:
```php
public function scopeFilter($query, array $filters) {
    if ( request('search') ?? false) {
        $query
            ->where('title','like','%' . request('search') . '%')
            ->orWhere('body','like','%' . request('search') . '%');
    }
}
```
## Trigger

Additionally, we can change the code to only apply when needed, like so:

```php
public function scopeFilter($query, array $filters) {
    $query->when($filters['search'] ?? false, function($query, $search) {
        $query
            ->where('title','like','%' . $search . '%')
            ->orWhere('body','like','%' . $search . '%');
    });
}
```