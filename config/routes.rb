Rails.application.routes.draw do
  devise_for :corporate_users, controllers: {
    sessions: 'corporate_users/sessions',
    passwords: 'corporate_users/passwords',
    registrations: 'corporate_users/registrations'
  }
  root to: "products#index"
  resources :products
  resources :corporate_users
end
