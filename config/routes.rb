Rails.application.routes.draw do
  devise_for :corporate_users
  root to: "products#index"
  resources :products
end
