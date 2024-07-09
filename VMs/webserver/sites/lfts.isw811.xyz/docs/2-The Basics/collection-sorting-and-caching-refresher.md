[< Go Back](../README.md)

# Cache

In out previous code we encounter the problem, again, that it is taxing to execute everytime.
To fix this, we must simply use cache, this time, forever.

```php
return cache()->rememberForever('posts.all', function() {
    return collect(File::files(resource_path("posts")))
    ->map(fn($file) => YamlFrontMatter::parseFile($file))
    ->map(fn($document) => new Post(
        $document->title,
        $document->excerpt,
        $document->date,
        $document->body(),
        $document->id
    ))
    ->sortByDesc('date');
});
```

There are also some commands useful to verify the cache state. For example:

1. `cache('posts.all')` to verify the cache in that key
2. `cache()->forget('posts.all')` to forget the cache in that key
3. `cache()->put('key','value)` to insert cache
