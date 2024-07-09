[< Go Back](../README.md)

# Laravel Breeze
Laravel offers two starter kits in the auth department.
1. Laravel Breeze: Minimal implementation of Laravel's auth features.
2. Laravel Jetstream: Apparently, a harder version of Laravel Breeze.

## Git

It's good pactice to save our projects in a repository system, like git.

```bash
git init
git add .
git commit -m 'Install framework'
composer require laravel/breeze --dev
php artisan breeze:install
```

## Installing dependencies and running the project

By now we should have both node and npm installed, so this will all work.

```bash
npm install && npm run dev
php artisan serve
```

## Configuring the Database

In the __.env__ file we can use whatever connection we like and make a database right in that project in the database section and migrating the database.

```bash
php artisan migrate
```

All of this will give us access to an already made registration and login system to edit as we please.

