Rails.application.routes.draw do

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  root 'items#index'

  get '/items', to: 'items#index'
  get '/cart', to: 'carts#show', as: "cart"
  post '/cart', to: 'carts#create'
  delete '/cart', to: 'carts#destroy'

  resources :items, only: [:new, :show]

  get ":slug" => "categories#show", :as => "category"
end
