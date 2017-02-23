Rails.application.routes.draw do
 
  root 'items#index'

  get '/items', to: 'items#index'

  resources :items, only: [:new]

  resources :carts


  get ":slug" => "categories#show", :as => "category"
  
end
