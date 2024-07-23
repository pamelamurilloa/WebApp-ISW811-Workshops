[< Go Back](../README.md)

# Going Crazy with Components

Througout the series we've been repeating a lot of code, mainly buttons, messages and forms. The start of this video is just to separate all of those blocks into smaller components.


## Button

```php
<x-form.field>
    <button type="submit"
            class="bg-blue-500 text-white uppercase font-semibold text-xs py-2 px-10 rounded-2xl hover:bg-blue-600"
    >
        {{ $slot }}
    </button>
</x-form.field>
```

## Error

```php
@props(['name'])

@error($name)
    <p class="text-red-500 text-xs mt-2">{{ $message }}</p>
@enderror
```

## Input

```php
@props(['name', 'type' => 'text'])

<x-form.field>
    <x-form.label name="{{ $name }}"/>

    <input class="border border-gray-400 p-2 w-full"
           type="{{ $type }}"
           name="{{ $name }}"
           id="{{ $name }}"
           value="{{ old($name) }}"
           required
    >

    <x-form.error name="{{ $name }}"/>
</x-form.field>
```

## Label
```php
@props(['name'])

<label class="block mb-2 uppercase font-bold text-xs text-gray-700"
       for="{{ $name }}"
>
    {{ ucwords($name) }}
</label>
```

## Textarea

Some inputs, like the textarea, are unique enough as to need their own component.

```php
@props(['name'])

<x-form.field>
    <x-form.label name="{{ $name }}" />

    <textarea
        class="border border-gray-400 p-2 w-full"
        name="{{ $name }}"
        id="{{ $name }}"
        required
    >{{ old($name) }}</textarea>

    <x-form.error name="{{ $name }}" />
</x-form.field>
```

## Result

This all together can look will look like this:

```php
<form method="POST" action="/admin/posts" enctype="multipart/form-data">
    @csrf

    <x-form.input name="title" />
    <x-form.input name="slug" />
    <x-form.input name="thumbnail" type="file" />
    <x-form.textarea name="excerpt" />
    <x-form.textarea name="body" />

    <x-form.field>
        <x-form.label name="category" />

        <select name="category_id" id="category_id">
            @foreach (\App\Models\Category::all() as $category)
                <option
                    value="{{ $category->id }}"
                    {{ old('category_id') == $category->id ? 'selected' : '' }}
                >{{ ucwords($category->name) }}</option>
            @endforeach
        </select>

        <x-form.error name="category" />
    </x-form.field>

    <x-form.button>Publish</x-form.button>
</form>
```

Much cleaner