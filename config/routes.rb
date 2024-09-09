Rails.application.routes.draw do
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show'
  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'
  post 'users/:id/rental', to: 'users#bond'
  put 'users/:id/edit', to: 'users#edit'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
  delete 'users/:id/rental/:rental_id', to: 'users#delete_bond'

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

  get "/cars", to: 'cars_report#index', defaults: {format: :pdf}
  get "/carsStore/(:option)", to: 'cars_stores_report#index', defaults: {format: :pdf}
  get "/a/(:option)", to: "cars_is_present_favorite#index", defaults: {format: :pdf}
  get "/b/(:option)", to: "favorites_cars_user_report#index", defaults: {format: :pdf}
  get "/ponto", to: "point_report#index", defaults: {format: :pdf}
end
