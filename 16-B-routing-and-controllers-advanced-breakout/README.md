*Reminder for instructor: Start quick time*

---

# Routing and Controllers - Advanced Concepts

This lesson introduces some more complex concepts related to Routing and Controllers.


## Agenda

- Recap & Context
- Review concepts we'll be covering today
- Deep dive into today's concepts
- Wrap-up: resources, review, what's next


## Recap & Context

- Pull the latest files from the team lesson repo
- How this lesson fits into the curriculum 


## Concepts

### Routing
- Multiple Static segments in a URL
- Multiple Dynamic segments in a URL
- Nested Resources
- Path & URL Helpers

### Controllers
- Overriding default view template
- Strong Params
- Filters
- Application Controller

### Wrap-up
- Recap
- Further Resources


# Routing

## Multiple Segments Resources

Anything static (not prefixed with a **colon**) must be matched exactly for a route to take effect.

In the following example:

```ruby
get 'stores/:store_id/products/:id' => 'products#show'
```

`stores` and `products` are static segments.


## Multiple Dynamic Segments

Anything dynamic (prefixed with a **colon**) can match on *anything*:

In the following example:

```ruby
get 'stores/:store_id/products/:id' => 'products#show'
```

`:store_id` and `:id` are dynamic segments, and the following would be legitimate matches:

```bash
http://localhost:3000/stores/99/products/333
http://localhost:3000/stores/silver_snail/products/spiderman_comic
```

## Nested Resources

We can nest resources to group collections with in collections. For example, if we just had products and we didn't need to nest them, we would use something like this:

```ruby
# config/routes.rb
resources :products
```

That would create the seven basic routes for our product and the would be accessable with 

```
/products
/products/new
/products/99
/products/99/edit
```

But let's say products varied from store to store, we might want to have each store have their own products, and setup our url structure like so:


```ruby
# config/routes.rb

resources :stores do
  resources :products
end
```

which would them create store urls and product urls for each store url:

```
/stores
/stores/new
/stores/33
/stores/33/edit
/stores/33/products
/stores/33/products/new
/stores/33/products/99
/stores/33/products/99/edit
```

## Path & URL Helpers

URL Helpers are just like Path helpers, except a full URL is created.

For example, if we add `as: 'product'` to the end of our route like so:

```ruby
# config/routes.rb
get 'products/:id' => 'products#show', as: 'product'
```

We will be able to use the following methods to generate a links to the product:

`product_path(55)` generates `/products/55`

`product_url(55)` generates `http://localhost:3000/products/55`

When working routes that have more than one dynamic segments (like nested routes), we need to pass in an argument for each dynamic segment. These arguments need to be in an array. For example, if we're nesting `products` under `stores`, like so:

```ruby
# config/routes.rb

resources :stores do
  resources :products
end
```

... this will produce routes that need to populate multiple dynamic segments:

```
$ rails routes
            Prefix   Verb     URI Pattern                           Controller#Action
            
<-- snip -->
  
edit_store_product   GET      /stores/:store_id/products/:id/edit   products#edit
     store_product   GET      /stores/:store_id/products/:id        products#show
     
<-- snip -->                     
```                   

We would then use the helpers like this:

```ruby
edit_store_product_path([@store, @product])
store_product_path([@store, @product])

# or

edit_store_product_path([@product.store, @product])
store_product_path([@product.store, @product])
```


## Views

We can override the default template to be rendered by explicitly specifying what template we'd like rendered. For example:

```ruby
  def show
    render 'my_special_template'
  end
```

will attempt to render `app/views/products/my_special_template.html.erb`


## Params Hash

### Controller and Action available

Along with providing access to form and url data, the **params hash** also contained the current **controller** and **action**.


### Multiple Dynamic Segements available

For example:

```ruby
get 'stores/:store_id/products/:id' => 'products#show'
```

has two dynamic segments (segments that begin with a colon), and this would match the route:

`http://localhost:3000/stores/99/products/333`

and would make `{ store_id: 99, id: 333 }` accessible via the params hash:

```ruby
params[:store_id]  # returns 99
params[:id]  # returns 333
```

## Strongs Params

Usually we specify what params we'll allow through using **Strong Params** instead of specifying each parameters.

So instead of:

```ruby
  def create
    @product = Product.new
    @product.name        = params[:product][:name]
    @product.description = params[:product][:description]
    @product.price       = params[:product][:price]

    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end
```

We would construct our Strong Params method like so:

```ruby
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
```

## Filters

If we need something to run before every method, we can use the `before_action` filter.  For example, this ensures the user is logged in before accessing this controller:

```ruby
class ProductsController < ApplicationController

  before_action :require_login

  # rest of controller
  ...
end
```

## Application Controller

Notice how our controller inherits from ApplicationController:

```ruby
class ProductsController < ApplicationController
```

We can put methods we want accessible to multiple controllers in the ApplicationController as they'll all inherit from them.

For example, the following would provide a useful current_user method throughout our controllers:

```ruby
class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
```


## Recap and Further Resources

#### Rails Guides: Rails Routing from the Outside In:
<http://guides.rubyonrails.org/routing.html>

#### Rails Guides: Action Controller Overview:
<http://guides.rubyonrails.org/action_controller_overview.html>

