Rails.application.routes.draw do

  root 'items#index'

  get '/items', to: 'items#index'
  get '/cart', to: 'carts#show', as: "cart"
  post '/cart', to: 'carts#create'
  delete '/cart', to: 'carts#destroy'

  resources :items, only: [:new]

  get ":slug" => "categories#show", :as => "category"
end
