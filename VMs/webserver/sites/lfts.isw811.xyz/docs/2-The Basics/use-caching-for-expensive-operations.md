[< Go Back](../README.md)

# Caching
Caching is an easy way to store information without having to call for it again and again.
To store something in cache, we must only 'remember' it. We must indicate what is being remembered, for how long, and a function to get said information if the cache doesnt exist.

```php
$postContent = cache()->remember("posts.{post}", now()->addMinutes(20), fn () => file_get_contents($path));
```