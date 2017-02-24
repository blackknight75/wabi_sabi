Rails.application.routes.draw do

  root 'items#index'

  get '/items', to: 'items#index'
  get '/cart', to: 'carts#show', as: "cart"
  post '/cart', to: 'carts#create'
  delete '/cart', to: 'carts#destroy'
  get '/login', to: 'sessions#new', as: "login"
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/dashboard', to:'users#show'
  post '/dashboard', to:'users#show'

  resources :items, only: [:new, :show]
  resources :users, only: [:show, :create]

  get ":slug" => "categories#show", :as => "category"
end
