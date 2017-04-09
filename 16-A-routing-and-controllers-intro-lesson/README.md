*Reminder for instructor: Start quick time*

---

# Routing and Controllers 

---

# Introduction (10 min)

Today we'll take our first deep dive into Rails and learn the fundamentals of Routing and Controllers in Rails.

## Agenda

- Recap & Context
- Review concepts we'll be covering today
- Deep dive into today's concepts
- Wrap-up: resources, review, what's next
- Lesson Exercise: Ipsum's Fairground


## Recap & Context

- Pull the latest files from the team lesson repo
- Review [Ruby on Rails: Request-Response Cycle Diagram](Ruby on Rails - Request Response Cycle.pdf)
- Questions about previous lesson.
- How this lesson fits into the curriculum 


## Concepts

In this lesson, you'll learn about:

### Routing
- Static Segments
- Dynamic Segments
- Path Helpers
- How To Display Routes
- Resourceful Routing

### Controllers
- CRUD
- Seven Controller Methods: Overview
- Views
- Params Hash
- Seven Controller Methods: In-depth
 - Index
 - Show
 - New
 - Create
 - Edit
 - Update
 - Destroy


## Overview

When an http request hits a Rails app, the **Router** analyzes the request and decides which **Controller** it will direct it to.

The **Controller** works with any **Models** necessary, and then renders the appropriate **View**.

See [Ruby on Rails: Request-Response Cycle Diagram](Ruby on Rails).

---

# Routing (25 min)

Routes are defined in `config/routes.rb`.

The router looks at **http request method** and **path** of the request, and then using pattern matching, calls the appropriate **controller** and **action** (aka. ruby method).

## Example

A visitor looking for details on a particular product goes to `http://store.com/products/55` with their web browser.

We have the following route defined:

```ruby
# config/routes.rb

Rails.application.routes.draw do

  get 'products/:id' => 'products#show'

end
```

This routes matches the request like so:

- `get` - matches the http request method.
- `products` - matches **/products/** in http://store.com/products/55
- `:id` - as it starts with a colon `:`, it's a wildcard match and will match anything. Therefore it matches **55** in http://store.com/products/55

The request is then sent on like so:

- `products` - to the **Products**Controller
- `show` - to the **show** action (ruby method) in the ProductsController

Inside of the Products Controller:

```ruby
# app/controllers/products_controller.rb

class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

end
```

The show method finds the product and then renders and returns the view.

## Static Segments

Anything static (not prefixed with a **colon**) must be matched exactly for a route to take effect.

In the following example:

```ruby
get 'products/:id' => 'products#show'
```

`products` is static segments.

## Dynamic Segments

Anything dynamic (prefixed with a **colon**) can match on *anything*.

In the following example:

```ruby
get 'products/:id' => 'products#show'
```

`:id` is a dynamic segment, and the following would be legitimate matches:

```bash
http://localhost:3000/products/333
http://localhost:3000/products/spiderman_comic
```

In the above cases, both `333` and `spiderman_comic` will be matched as `:id`.

## URL and Path Helpers

Along with deciding how it will dispatch an http request, the router can create URL and Path helpers that can be used in Controllers and Views.

For example, if we add `as: 'product'` to the end of our route like so:

```ruby
# config/routes.rb
get 'products/:id' => 'products#show', as: 'product'
```

We will be able to use the following methods to generate a link to the product:

`product_path(55)` generates `/products/55`
`product_url(55)` generates `http://localhost:3000/products/55`


## Displaying Routes

To see what routes currently exist in your application, use the following from the command line:

```bash
rails routes
```

For our products example, we would see the following:

```bash
Prefix   Verb  URI Pattern    Controller#Action
product  GET   /products/:id  products#show
```

## Resource Routing

A shorthand technique for creating the standard CRUD* routes* is called Resourceful Routing.

*CRUD = Create Read Update Delete

```ruby
# config/routes.rb

resources :products
```

is the equivalent of:

```ruby
# config/routes.rb
get    'products'          => 'products#index',  as: 'products'
post   'products'          => 'products#create'
get    'products/new'      => 'products#new',    as: 'new_product'
get    'products/:id'      => 'products#show',   as: 'product'
get    'products/:id/edit' => 'products#edit',   as: 'edit_product'
patch  'products/:id'      => 'products#update'
delete 'products/:id'      => 'products#destroy'
```

## Root

To direct a url without a path (aka the `root` path), use:

```ruby
root to: 'products#index'
```

If your url is `localhost:3000`, then this would direct 
`http://localhost:3000/` to the index method in the Products Controller.

---

# Controllers (35 min)

## CRUD

When we think about data and how we manipulate it, we use the acronym CRUD to describe what we can do with this data:

- **C**reate a record
- **R**ead a record
- **U**pdate a record
- **D**elete a record

You'll hear developers say things like "Oh ya, it's just a basic **CRUD** app." (and one day, you'll say this too).

## Seven Controller Methods - Overview

A standard controller will have the following methods:

Controller Method | HTTP Request Method | Description
----------------- | ------------------- | -----------
index | get | request that retrieves a collection of records
show | get | request that retrieves a single record
new | get | request to pull up a form for a new record
create | post | request that handles the submission of a form to create a new record
edit | get | request to pull up a form for an existing record
update | patch | request handles the submission of a form to update an existing record
destroy | delete | request to remove a single record



## Views

For `get` requests, the **controller** will implicitly try to render (process and send back as html) a template in a folder named after the controller, and a file named after the method.

For example, a `ProductsController` will try to render the following:


```ruby
class ProductsController < ApplicationController

  def show
   # renders app/views/products/show.html.erb
  end

  def index
   # renders app/views/products/index.html.erb
  end

  def new
   # renders app/views/products/new.html.erb
  end

  def edit
   # renders app/views/products/edit.html.erb
  end

end
```

## Params Hash

Information about the http request will be accessible via the **Params Hash**.

The params hash contains:

- form data from a `post` request
- dynamic segment route matches in url. For example:

```ruby
get 'products/:id' => 'products#show'
```

would match the route:

`http://localhost:3000/products/333`

and would make `{ id: 333 }` accessible through the params hash:

```ruby
params[:id]  # returns 333
```

## Seven Controller Methods - In-depth

### Index

For retrieving a collection of items.

```ruby
def index
  @products = Product.all
end
```

Notice how `@products` is pluralized. This is because it's a collection (and possibly more than one) of all the products.

### Show

For retrieving a single item.

```ruby
def show
  @product = Product.find(params[:id])
end
```

Notice how `@product` is singular. This is because it's an single (only one) item.

### New

For retrieving a form for a new item using a **get** request.

```ruby
def new
  @product = Product.new
end
```

We setup a `new` product and store it inside the `@product` **instance variable**. Note that this `product` hasn't yet been saved to the database.

### Create

For processing a **post** request to create a new item:

```ruby
def create
  @product = Product.new
  @product.name        = params[:product][:name]
  @product.description = params[:product][:description]
  @product.price       = params[:product][:price]
  
  if @product.save
    flash.notice = 'Product successfully created!'
    redirect_to products_url
  else
    flash.alert = 'Product could not be created. Please correct and try again.'
    render 'new'
  end
end
```

If the `product` successfully saves, it will now be stored permanently in the database.

### Edit

For retrieving a form for an existing item using a **get** request:

```ruby
def edit
  @product = Product.find(params[:id])
end
```

This loads the product from the database and stores its current state inside the `@product` **instance variable**. Note that the **edit** method does not yet save the changes to the product.

### Update

For processing a **patch** request to update an existing item:

```ruby
def update

  @product       = Product.find(params[:product][:id])
  @product.name  = params[:product][:name]
  @product.price = params[:product][:price]
  
  if @product.save
    flash.notice = 'Product successfully updated!'
    redirect_to product_url(@product)
  else
    flash.alert = 'Product could not be updated. Please correct and try again.'
    render 'edit'
  end
  
end
```

If the `product` successfully saves with the altered values from the form, the changes will now be stored permanently in the database.

### Destroy

```ruby
def destroy

  @product = Product.find(params[:id])
  @product.destroy!
  flash.notice = 'Product successfully deleted.'
  redirect_to products_url
  
end
```

---

# Wrap-up (10 min)

## Further Resources

#### Rails Guides: Rails Routing from the Outside In:<br><http://guides.rubyonrails.org/routing.html>

#### Rails Guides: Action Controller Overview:<br><http://guides.rubyonrails.org/action_controller_overview.html>


## Review

- Review Concepts


## What's next?

- Views and Forms
- Models and Database
- Advanced Routing & Controller Concepts:
  - Strong Params
  - Nested Routing
  - Filters

---

# Lesson Exercise (remaining time)

Let's make **Ipsum's Fairground**, a *CRUD* application for promoting Ipsum's Rides.
