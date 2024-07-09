[< Go Back](../README.md)

# Fixing an additional post

Right now, the program may add an unwanted post due to an error in parenthesis inside the query. This is caused by us not closing the 'text matches title or body' part. To close it properly, we must add an additional function inside of our query in the Post Model, like so:

```php
$query->when($filters['search'] ?? false, fn($query, $search) =>
    $query->where(fn($query) => 
        $query->where('title','like','%' . $search . '%')
        ->orWhere('body','like','%' . $search . '%')
    )
);
```

And with that, the bug should be fixed. In my page this didn't happen, so it's not always visible and for that, we should check the queries externally to avoid errors.