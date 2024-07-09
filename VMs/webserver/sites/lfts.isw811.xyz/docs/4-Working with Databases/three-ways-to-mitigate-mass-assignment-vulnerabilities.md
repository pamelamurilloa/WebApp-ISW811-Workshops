[< Go Back](../README.md)

# Fillable properties

You can mass asign value to any object as long as the variable is fillable. The property being fillable defines which atributes can be mass assigned.

So, in the Post model, we should have this:

```php
protected $fillable = ['title', 'excerpt', 'body'];
```

## Mass assigned vulnerability

When you allow something you should'nt to be mass fillable, like the id, you put the web at risk. One way to protect the page is to use the $guarded property.

```php
protected $guarded = ['id'];
```

Other ways to protect you from this vulnerability is to never provide $fillables properties