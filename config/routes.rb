Rails.application.routes.draw do
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

  resources :products
  resources :corporate_users 
  resources :users

  get '/corporate_users_showinfo/:id', to: 'corporate_users#showinfo'

end
