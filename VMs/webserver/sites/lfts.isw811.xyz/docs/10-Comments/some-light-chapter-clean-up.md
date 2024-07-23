[< Go Back](../README.md)

# Showing an error message

To make the website a bit more complete, we should show error messages in case someone tries to post a comment without first actually commenting something.

```php
@error('body')
    <span class="text-xs text-red-500">{{ $message }}</span>
@enderror
```

And of course, mark the message as required.

# Component Form

The form is a bit too large, so we can make it it's own component and include it in the form, like so: `@include ('posts._add-comment-form')`

# Submit Button

We're probably going to create a lot of buttons, particularly a submit button, so we can create another component to do that:

```php
<button type="submit"
        class="bg-blue-500 text-white uppercase font-semibold text-xs py-2 px-10 rounded-2xl hover:bg-blue-600"
>
    {{ $slot }}
</button>
```