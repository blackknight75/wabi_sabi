Rails.application.routes.draw do

  root 'items#index'

  get '/items', to: 'items#index'
  get '/cart', to: 'carts#show', as: "cart"
  post '/cart', to: 'carts#create'
  delete '/cart', to: 'carts#destroy'

  resources :items, only: [:new, :show]
  resources :users, only: [:new, :show]

  get ":slug" => "categories#show", :as => "category"
end
