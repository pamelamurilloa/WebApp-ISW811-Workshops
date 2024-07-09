[< Go Back](../README.md)

# Changing categories

To work on changing the categories we want to make it with alpine, but this, it's only a matter of integrating the link into the project via a link in the layout, this link: `<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
`

And then apply it using x-data(), for example:

```php
<div x-data="{show: false}">
    <button @click="show = ! show" class="py-2 pl-3 pr-9 text-sm font-semibold">Categories</button>

    <div x-show="show" class="py-2 absolute bg-grey-100">
        <a href="#" class="block text-left px-3 text-sm leading-5"></a>
    </div>
</div>
```

Additionally, if we click on the button, show is set to its opposite

The css is up to each person, depends on how enthusiastic you are about it.