Rails.application.routes.draw do

  get 'rides' => 'rides#index'
  get 'ride/:id' => 'rides#show', as: 'ride'

end
