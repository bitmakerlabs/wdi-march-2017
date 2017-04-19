Rails.application.routes.draw do

  resource :users, only: %i(new create)
  resource :sessions, only: %i(new create destroy)

  root 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
