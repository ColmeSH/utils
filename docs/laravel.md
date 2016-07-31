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

##Laravel Vagrant

Laravel ready environment.
You will need installed

    - virtualbox
    - vagrant
    - ansible 2+

Suggested repositories

    - https://github.com/andreafspeziale/laravel_vagrant
    - https://github.com/gab88slash/vagrant-modern-php-development

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

    <body>
        <div class="container">
            @yield('content')
        </div>
        @yield('footer') <!-- You will be able to add this only in specific files -->
    </body>

In a random contact page:

    @extends('app')
    @section('content')
        <h1>Contact Me!</h1>
        <p>Lorem ipsum</p>
    @stop
    @section('footer')
        <script>some script</script> <!-- You will be able to avoid it in other pages -->
    @stop

##Fast IF statement in blade

Instead of opening php tags

    @if($firstName == "Andrea")
        <h1>About me: {{ $firstName }} {{ $lastName }}</h1>
        <p>Lorem ipsum</p>
    @else
        <p>Error</p>
    @endif

We have also

    - @unless()
    - The controller returning something like: $people = ['Alex', 'Gabri', 'Andre'];

    @if(count($people))
        <h3>People I like:</h3>
        <ul>
            @foreach($people as $person)
                <li>{{ $person }}</li>
            @endforeach
        </ul>
    @endif

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

##Basic model/controller/view workflow

Different way to create routes

For small stuff you can create directly from route file something like

    Route::get('foo', function(){
        return "bar";
    });

or

    Route::get('articles', 'ArticlesController@index');

now create a controller from command line

    - php artisan make:controller ArticlesController

and add an index method to see if does it works

    class ArticlesController extends Controller
    {
        public function index() {
            return "Getting all articles";
        }
    }

adding the class on the top

    - use App\Article;

and try to return all the articles (and then check the browser)

    class ArticlesController extends Controller
    {
        public function index() {
            //return "Getting all articles";

            //fetching all the articles with eloquent
            $articles = \App\Article::all();
            return $articles;
        }
    }

Now lets try to return a view with some stuff

    class ArticlesController extends Controller
    {
        public function index() {
            //return "Getting all articles";

            //fetching all the articles with eloquent
            $articles = \App\Article::all();
            return view("articles.index", compact('articles'));
            //or return view("articles.index")->with('articles', $articles);
        }
    }

now add the folder and file

    - mkdir resources/views/articles/index.blade.php

and fill it with

    @extends('app')
    @section('content')
        <h1>Articles</h1>
        <hr>
        @foreach($articles as $article)
            <article>
                <a href="#">
                    <h3>{{$article->title}}</h3>
                </a>
                <div class="body">{{$article->body}}</div>
            </article>
        @endforeach
    @stop

and what about clicking the article title? Lets add a new route

    - Route::get('articles/{id}', 'ArticlesController@show');

Now add the new function inside the controller accepting the $id

    public function show($id) {
        $article = Article::findOrFail($id);

        /*to avoid this you can use findOrFail
            dd($article);
            if(is_null($article)) { //if(!$article)
                abort(404);
            }
        */

        return view("articles.show", compact('article'));
    }

and create the view

    - mkdir resources/views/articles/show.blade.php

    @extends('app')
    @section('content')
        <h1>Articles</h1>
        <hr>
        @foreach($articles as $article)
            <article>
                {{--<a href="/articles/{{$article->id}}">--}}
                {{--<a href="{{url('/articles', $article->id)}}">--}}
                <a href="{{action('ArticlesController@show', [$article->id])}}">
                    <h3>{{$article->title}}</h3>
                </a>
                <div class="body">{{$article->body}}</div>
            </article>
        @endforeach
    @stop

##Defining Relationships With Eloquent

We have for instance a Card which has many Notes. 
Each Note was wtitten by a User.

You can see below the models that describes those relationships:

    - Card Model
    class Card extends Model
    {
        public function notes()
        {
            return $this->hasMany(Note::class);
        }
        
        public function addNote(Note $note, $userId)
        {
            $note->user_id = $userId;
            return $this->notes()->save($note);
        }
    }
    
    - Note Model
    class Note extends Model
    {
        protected $fillable = ['body'];
    
        public function card()
        {
            return $this->belongsTo(Card::class);
        }
    
        public function user()
        {
            return $this->belongsTo(User::class);
        }
        
        public function by(User $user)
        {
            $this->user_id = $user->id;
        }
    }

##Forms & Validation

Let's add a Note to a Card for instance:

    - add a posting route
    Route::post('cards/{card}/notes', 'NotesController@store');
    
    - add a form from the view
    <h3>Add a new note</h3>
        <form action="/cards/{{ $card->id }}/notes" method="POST">
            {{-- showing the token --}}
            {!! csrf_token() !!}
            <div class="form-group">
                <textarea name="body" class="form-control">{{ old('body') }}</textarea>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-default pull-right">Add note</button>
            </div>
            {{-- this include the generated token in the request --}}
            {!! csrf_field() !!}
        </form>
        {{-- checking the validation exception message --}}
        {{-- {{ var_dump($errors) }} --}}
        @if(count($errors))
            <ul>
                @foreach($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        @endif
        
    - from the posting route by the store method
    public function store(Request $request, Card $card)
        {
            $this->validate($request, [
                'body' => 'required|min:10'
            ]);
    
            $note = New Note($request->all());
    
            $card->addNote($note, 1);
            return back();
        }
        
##Updating Record

Let's try to update a Note

    - add a get and patch route to serve the update page and perform action 
    Route::get('notes/{note}/edit', 'NotesController@edit');
    Route::patch('notes/{note}', 'NotesController@update');
        
    - edit form from the edit note page
    <form action="/notes/{{ $note->id }}" method="POST">
        {{ method_field('PATCH') }}
        <div class="form-group">
            <textarea name="body" class="form-control">{{ $note->body }}</textarea>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-default pull-right">Update note</button>
        </div>
        {!! csrf_field() !!}
    </form>
    
    - and the methods in the controller
    public function edit(Note $note)
    {
        return view('notes.edit', compact('note'));
    }

    public function update(Request $request, Note $note)
    {
        $note->update($request->all());
        return back();
    }

##Authenticate Your Users

Basic login/registration, usually is done at the very beginning of your project

    - php artisan make:auth
    - php artisan migrate
    
Now you should be ready to test the laravel register and login out of the box functions

To test the forgotten psw e-mail you should change your local .env like this

    - MAIL_DRIVER=log
    
Setup also from config/mail.php
 
    - 'from' => ['address' => 'yourmail@something.something', 'name' => 'My Company Support']
    
Now if you try to restore your password it will run using your registration e-mail 
but you wont receive any e-mail, you will be able to check in

    - more storage/logs/laravel.log or tail -f storage/logs/laravel.log
    
You should see something like

    - Date: Sat, 30 Jul 2016 14:37:53 +0000
      Subject: Your Password Reset Link
      From: Andrea Speziale Mail <andreaf.speziale@gmail.com>
      To: andreaf.speziale@gmail.com
      MIME-Version: 1.0
      Content-Type: text/html; charset=utf-8
      Content-Transfer-Encoding: quoted-printable
      
      Click here to reset your password: 
      <a href="http://localhost:8080/password/reset/5d09c9f1640669def46092bbecc8c02949be8b51bd1a1c49a180dea5613e1b9c?email=registeredMail%40gmail.com"> http://localhost:8080/password/reset/5d09c9f1640669def46092bbecc8c02949be8b51bd1a1c49a180dea5613e1b9c?email=registeredMail%40gmail.com </a>

If you copy on your browser the link you will be redirect to the password reset page

Notice that in your routes file laravel added 

    - Route::auth();
    
In Router.php searching for auth you will find all the route

If you need to override something you will find everything in

    - Http/Controller/auth
    
All the views are stored in

    - Resources/views/auth
    
##Middleware

Your application is like an onion, so when a request arrives it goes through this onion before gettin' into the core.
Those layers are the middleware.

For instance the middleware group WEB

    - app/Http/Kernel
    'web' => [
        \App\Http\Middleware\EncryptCookies::class,
        \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
        \Illuminate\Session\Middleware\StartSession::class,
        \Illuminate\View\Middleware\ShareErrorsFromSession::class,
        \App\Http\Middleware\VerifyCsrfToken::class,
    ],
    
The request will pass through those action

    - EncryptCookies
    - AddQueuedCookiesToResponse
    - StartSession
    - ShareErrorsFromSession -> this make the var $errors in each view real
    - VerifyCsrfToken -> generates the hiddend input in the forms {{ csrf_field() }}
    
Each middleware class has a handle class

    - public function handle
    
responsible for processing the request in someway and pass it to the next layer.

Usually we make some kind of check and then we will pass it to the next level of the onion or abort.

We have also GLOBAL Middleware that will be used for every single request like

    - \Illuminate\Foundation\Http\Middleware\CheckForMaintenanceMode::class,
    
This is checking if the website is in Maintenance Mode, you can try to put it in with

    - php artisan down
    
To restore 

    - php artisan down
    
Or we have optional middleware called ROUTE Middleware, you can create a middleware with artisan like this

    - php artisan make:middleware MustBeAdministrator

For instance

    <?php
    
    namespace App\Http\Middleware;
    
    use Closure;
    
    public function handle($request, Closure $next)
    {
        /*
         * If signed u will get the signed user if not you will get null
         * */

        $user = $request->user();

        /*
         * Checking if is admin
         * if($user && $user->isAdmin)
         * */
        if($user && $user->username == 'JohnAdministratorDoe'){
            return $next($request);
        }

        /*
         * If not aborting it
         * */
        abort(404, 'No way.');
    }
        
Go to

    - app/Http/kernel.php
    protected $routeMiddleware = [
        'auth' => \App\Http\Middleware\Authenticate::class,
        'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
        'can' => \Illuminate\Foundation\Http\Middleware\Authorize::class,
        'guest' => \App\Http\Middleware\RedirectIfAuthenticated::class,
        'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class,
        'admin' => \App\Http\Middleware\MustBeAdministrator::class
    ];
    
## Session Messages