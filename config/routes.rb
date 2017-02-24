Rails.application.routes.draw do

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  root 'items#index'

  get '/items', to: 'items#index'
  get '/cart', to: 'carts#show', as: "cart"
  post '/cart', to: 'carts#create'
  delete '/cart', to: 'carts#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show', as: "user"
  post '/dashboard', to: 'users#show'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :items, only: [:new, :create, :show]
  resources :users, only: [:create, :show]

  get ":slug" => "categories#show", :as => "category"
end
