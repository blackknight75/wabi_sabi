Rails.application.routes.draw do

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  root 'items#index'

  get '/items', to: 'items#index'
  get '/cart', to: 'carts#show', as: "cart"
  post '/cart', to: 'carts#create'
  delete '/cart', to: 'carts#destroy'
  patch '/cart', to: 'carts#update'
  get '/login', to: 'sessions#new', as: "login"
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/dashboard', to:'users#show'
  post '/dashboard', to: 'users#show'
  namespace :admin do
    get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  end
  resources :items, only: [:new, :show]
  resources :users, only: [:show, :create]
  resources :orders, only: [:new, :create, :show, :index]

  get ":slug" => "categories#show", :as => "category"
end
