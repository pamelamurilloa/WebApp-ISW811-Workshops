[< Go Back](../README.md)

# Create a New Service

We can create our own service via a Class, of course. To be able to do this, we create a folder with a fitting name like 'Services' and inside of it, we will put Newsletter.

This new service will be responsable of all things related to the newsletter. Note that it isn't a model because it doesn't really have it's own table in the DB.

We paste our code in there.

```php
public function subscribe(string $email)
{
    $mailchimp = new ApiClient();

    $mailchimp->setConfig([
        'apiKey' => config('services.mailchimp.key'),
        'server' => 'us17'
    ]);

    $response = $mailchimp->lists->addListMember('4fb37fc907', [
        'email_address' => 'email',
        'status' => 'subscribed'
    ]);
}
```

## Avoiding the ID on display

We can treat the list id as any other constant and put it in our .env file to be able to get 'lists' using mailchimp.

```php
'mailchimp' => [
        'key' => env('MAILCHIMP_KEY'),
        'lists' => [
            'subscribers' => env('MAILCHIMP_LIST_SUBSCRIBERS')
        ]
    ]
```

With this, we can do more key changes to allow for a list to be sent and read.

```php
public function subscribe(string $email, string $list = null)
    {
        $list ??= config('services.mailchimp.lists.subscribers');

        return $this->client()->lists->addListMember($list, [
            'email_address' => $email,
            'status' => 'subscribed'
        ]);
    }

    protected function client()
    {
        return (new ApiClient())->setConfig([
            'apiKey' => config('services.mailchimp.key'),
            'server' => 'us6'
        ]);
    }
```

# Creating Another Controller

We should create our own controller to keep the routes file tidy, so, again: `php artisan make:controller NewsletterController`
And with this done we can make a single command controller and call it in route: `Route::post('newsletter', NewsletterController::class);`.

Inside the controller, we'll paste the code we had previously in the web file.

```php
public function __invoke(Newsletter $newsletter)
    {
        request()->validate(['email' => 'required|email']);

        try {
            $newsletter->subscribe(request('email'));
        } catch (Exception $e) {
            throw ValidationException::withMessages([
                'email' => 'This email could not be added to our newsletter list.'
            ]);
        }

        return redirect('/')
            ->with('success', 'You are now signed up for our newsletter!');
    }
```



