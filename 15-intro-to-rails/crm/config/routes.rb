Rails.application.routes.draw do
  get 'contacts/index'

  get 'contacts/new'

  get 'contacts/create'

  get 'contacts/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
