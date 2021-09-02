Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }

  devise_for :corporate_users, controllers: {
    sessions: 'corporate_users/sessions',
    passwords: 'corporate_users/passwords',
    registrations: 'corporate_users/registrations'
  }
  root to: "products#index"

  resources :products do
    post '/add_item', to: 'carts#add_item'
    patch '/update_item', to: 'carts#update_item'
    delete '/delete_item', to: 'carts#delete_item'
  end
  
  resources :admins
  resources :corporate_users 
  resources :users
  resources :carts
  resources :purchase_histories, only: [:index, :create]

  get '/corporate_users_showinfo/:id', to: 'corporate_users#showinfo'
  get "/recent_products", to: "products#recent_products"
  get "/popular_products", to: "products#popular_products"
  get '/my_cart', to: 'carts#my_cart'
  get "/order_completed", to: "purchase_histories#order_completed"
end
