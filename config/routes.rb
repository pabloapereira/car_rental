Rails.application.routes.draw do
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show'
  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'
  put 'users/:id/edit', to: 'users#edit'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'

  # Rotas Store
  get 'stores', to: 'stores#index'
  get 'stores/:id', to: 'stores#show' 
  get 'stores/new', to: 'stores#new'
  post 'stores', to: 'stores#create'
  put 'stores/:id/edit', to: 'stores#edit'
  put 'stores/:id', to: 'stores#update'
  delete 'stores/:id', to: 'stores#destroy'

  # Rotas Car
  get 'cars', to: 'cars#index'
  get 'cars/:id', to: 'cars#show'
  post 'cars', to: 'cars#create'
  put 'cars/:id', to: 'cars#update'
  delete 'cars/:id', to: 'cars#destroy'

  # Rotas Favorite
  get 'favorites', to: 'favorites#index'
  get 'favorites/:id', to: 'favorites#show'
  post 'favorites', to: 'favorites#create'
  put 'favorites/:id', to: 'favorites#update'
  delete 'favorites/:id', to: 'favorites#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check
end
