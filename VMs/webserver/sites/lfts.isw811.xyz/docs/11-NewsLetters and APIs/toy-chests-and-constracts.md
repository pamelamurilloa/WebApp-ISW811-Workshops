[< Go Back](../README.md)

# Laravel Inner Workings

Normally, if you don't have a constructor nor any other value that may alter how to make a 'new' something, laravel tries to figure out how to make that work. This becomes difficult and will fail if not given enough information, but we can code this little section into our AppServiceProvider to get the blanks when needed.

In this case, we're explicitly telling Laravel on how to construct our Newsletter. To make things more organized, we also paste our previous set cnofiguration into it.

```php
app()->bind(Newsletter::class, function () {
            $client = (new ApiClient)->setConfig([
                'apiKey' => config('services.mailchimp.key'),
                'server' => 'us6'
            ]);

            return new Newsletter($client);
        });
```

# Preparing for Other Service Letters

Now, the code we have right now is very specific to Mailchimp, so we want to reflect that in the name of the file.

```php
<?php

namespace App\Services;

use MailchimpMarketing\ApiClient;

class MailchimpNewsletter
{
    public function __construct(protected ApiClient $client)
    {
        //
    }

    public function subscribe(string $email, string $list = null)
    {
        $list ??= config('services.mailchimp.lists.subscribers');

        return $this->client->lists->addListMember($list, [
            'email_address' => $email,
            'status' => 'subscribed'
        ]);
    }
}
```

To make the relations between them clear, we can make an 'interface' to represent that contract;

```php
namespace App\Services;

interface Newsletter
{
    public function subscribe(string $email, string $list = null);
}
```

For this to work, we have to add `implements Newsletter` to the `class MailchimpNewsletter`in the file we were working before.

And then all that's left is making sure every variable called is in it's place, like the one in the AppServiceProvider, referencing first Newsletter to make it non-specific and then returning a particular way to be able to read it.

```php
app()->bind(Newsletter::class, function () {
    $client = (new ApiClient)->setConfig([
        'apiKey' => config('services.mailchimp.key'),
        'server' => 'us6'
    ]);

    return new MailchimpNewsletter($client);
});
```
