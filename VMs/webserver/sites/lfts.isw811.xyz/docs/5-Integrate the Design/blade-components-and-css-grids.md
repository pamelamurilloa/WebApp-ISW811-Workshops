[< Go Back](../README.md)

# Feature card

We need to send a post to the card, to do this, we use `:` before the code

```php
<x-post-featured-card :post="$posts[0]" />
```

At the top of post-featured =-card, we declare it as a `@props(['post'])` and change certain code parts, like 'title' accordingly

```php
<h1 class="text-3xl">
    {{ $post->title }}
</h1>
```

Simple as that.

# All the others

For the rest of the posts, we should use variables inside the code, as we've been doing, and also use a foreach to display them, like so:

```php
<div class="lg:grid lg:grid-cols-2">
    @foreach ($posts->skip(1) as $post)    
        <x-post-card :post="$post"/>
    @endforeach
</div>
```

# Preventing Errors

To prevent any errors from appearing too violently, we should write a couple of if statements in the posts file

```php
@if ($posts->count())
    <x-post-featured-card :post="$posts[0]"/>

    @if ($posts->count() > 1)

        <div class="lg:grid lg:grid-cols-2">
            @foreach ($posts->skip(1) as $post)    
                <x-post-card :post="$post"/>
            @endforeach
        </div>
    @endif
@else
    <p class="text-center">No posts yet, we're very sorry</p>
@endif
```

# Grids

While working with grids, it's important to keep the developer tools nearby to check the hidden lines, it can really help.

It's also important to mention that one can alter the class of a tag in a few different ways.

1. By including attributes to them:

```php
    {{$attributes->merge (['class' => "transition..."])}}>
```

2. By introducing an if in the code:

```php
class="{{ $loop->iteration < 3 ? 'col-span-3' : 'col-span-2'}}"/>
```

# Tweaking

Let's not forget we can always create more components to create a more clean workspace.