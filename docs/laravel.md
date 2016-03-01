# Laravel Utils

##Composer

Php dependencies manager.
Install with

    - curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

Add something to your composer json

    - composer require phpspec/phpspec (vendor/pck)

More packages at

    - https://packagist.org/

Create a new virgin laravel project with

    - composer create-project laravel/laravel NAME

##Homestead

Laravel ready environment.
You will need installed

    - virtualbox
    - vagrant

Add the homestead vagrant box with

    - vagrant box add laravel/homestead

Install homestead with composer

    - composer global require "laravel/homestead=~2.0"

Be sure to add the PATH to your bash or zsh profile in order to use homestead

    - export PATH:~/.composer/vendor/bin:$PATH

Try to run homestead and you will see all the commands available

    - homestead

Check .homestead folder ~ or the configuration with

    - homestead edit

[PROBLEMS] - 500 server error, nginx has permission problems

Laracasts is using homestead like this

    - serve domain path

but its searching for a file called serve.sh and I have serve-laravel and I can't cp it

##Structure

app HTTP --> routes.php --> route file

    - Route::get('about', 'PagesController@about');

This will search a PagesController with a method "about"

##Environment

Everything is inside .env file

##Creating new controller

You can do this with laravel cli called Artisan

    - php artisan make:controller PagesController --plain (--plain doesn't exist anymore)

for help

    - php artisan help make:controller

##Passing data to view

First way

    - return view('pages.about')->with('name', $name);
    - return view('pages.about')->with([
            'firstName' => 'Andrea',
            'lastName' => 'Speziale'
        ]);
    - return view('pages.about', $data);
    - return view('pages.about', compact('firstName', 'lastName'));

in the html

    - {!! $name !!} with escaping
    - {{ $name }}

##Master and sections

Create an app.blade.php file which will contain the basic html, in master:
    ```html
        <body>
            <div class="container">
                @yield('content')
            </div>
            @yield('footer') <!-- You will be able to add this only in specific files -->
        </body>
    ```

In a random contact page:
    -   ```html
        @extends('app')
        @section('content')
            <h1>Contact Me!</h1>
            <p>Lorem ipsum</p>
        @stop
        @section('footer')
            <script>some script</script> <!-- You will be able to avoid it in other pages -->
        @stop
        ```

##Fast IF statement in blade

Instead of opening php tags

    -   @if($firstName == "Andrea")
            <h1>About me: {{ $firstName }} {{ $lastName }}</h1>
            <p>Lorem ipsum</p>
        @else
            <p>Error</p>
        @endif

We have also

    - @unless()
    -   The controller returning something like: $people = ['Alex', 'Gabri', 'Andre'];
        ```html
        @if(count($people))
            <h3>People I like:</h3>
            <ul>
                @foreach($people as $person)
                    <li>{{ $person }}</li>
                @endforeach
            </ul>
        @endif
        ```

##More about configuration

    - config folder-->database.php

For example u will find mysql ready to get the configuration from the .env file.
This file is also ignored by the .gitignore file, so you can have separate config for local and production environment

    - 'host' => env('DB_HOST', 'localhost')

This will be searching for a DB_HOST variable in the env file and if it will be not found, will take the localhost as default

    - Default connection to mysql from database.php 'default' => env('DB_CONNECTION', 'mysql')

##Migration

Version control for DBs.
Tables as php classes.

Create the class and then create the table.

[I had to install manually sqlite - sudo apt-get install php5-sqlite]

    - php artisan migrate
    - php artisan migrate:reset [roolback all migration]
    - php artisan migrate:rollback [roolback last migration]

Example --> create a table for Articles

    -  php artisan make:migration create_articles_table --create="articles"

If for example you want to add a new column for Articles

    - php artisan make:migration add_excerpt_to_articles_table --table="articles"

It will create a new file which "extends" articles and you will write in the up function the new column

    - $table->text("excerpt")->nullable(); //if you agree that your article excerpt could be empty

and you will write in the down function

    - $table->dropColumn("excerpt");

try to migrate it and rollback it too!

    - php artisan migrate
    - php artisan:rollback --> ERROR --> you will need composer require doctrine/dbal

##Eloquent [ORM]

Record implementation

    - php artisan create:model Article

Useful laravel cli for testing
    - php artisan tinker
        - $article = new App\Article
        - $article->title='my first article'
        - $article->body='lorem ipsum'
        - $article->published_at=Carbon\Carbon::now();
        - $article or $article->toArray();

Now make it persistent

        - $article->save();

Fetching it

        - App\Article::all()->toArray();

Updating

        - $article->title = 'My Updated First Article';
        - $article->save();
        - App\Article::all()->toArray();

How we could do it: select * from table where id = 1;

        - $article = App\Article::find(1);
        - $article or $article->toArray();

How we could do it: select * from articles where body = 'lorem ipsum';

        - $article = App\Article::where('body', 'lorem ipsum')->get();
        - $article = App\Article::where('body', 'lorem ipsum')->first(); to get the very first

Fill the object in one time

        - $article = App\Article::create(['title'=>'Very new article', 'body'=>'New body', 'published_at'=>Carbon\Carbon::now()]);

    you will get a MassAssignmentException, so you will go to Article.php model and update it with

        -   protected $fillable=[
                'title',
                'body',
                'published_at'
            ];

    exit from the tinker, re-open it and retry

        - $article = App\Article::create(['title'=>'Very new article', 'body'=>'New body', 'published_at'=>Carbon\Carbon::now()]);

A fast way to update

        - $article = App\Article::find(2);
        - $article->update(['body' => 'Updated!!']); //filling and saving it
