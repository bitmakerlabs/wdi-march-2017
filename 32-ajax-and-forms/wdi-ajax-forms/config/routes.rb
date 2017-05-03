Rails.application.routes.draw do

  resources :greetings
  root 'greetings#index'

end
