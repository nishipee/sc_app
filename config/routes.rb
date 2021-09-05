Rails.application.routes.draw do

  root to: "products#index"

  # 管理者
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  resources :admins, only: :index
  get "/show_c_user/:corporate_user_id", to: "admins#show_c_user"
  get "/show_sc_group/:sc_group_id", to: "admins#show_sc_group"


  # ユーザー
  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }

  resources :users, only: [:show, :edit, :update]
  get "/order_products/:id", to: "users#order_products"
  get "/donation/:id", to: "users#donation"


  # 出店店舗
  devise_for :corporate_users, controllers: {
    sessions: "corporate_users/sessions",
    passwords: "corporate_users/passwords",
    registrations: "corporate_users/registrations"
  }

  resources :corporate_users, only: [:show, :edit, :update]
  get "/corporate_users_showinfo/:id", to: "corporate_users#showinfo"
  

  # 商品 カート
  resources :products do
    post "/add_item", to: "carts#add_item"
    patch "/update_item", to: "carts#update_item"
    delete "/delete_item", to: "carts#delete_item"
  end

  resources :carts, only: :destroy
  get "/recent_products", to: "products#recent_products"
  get "/popular_products", to: "products#popular_products"
  get "/my_cart", to: "carts#my_cart"


  # 購入履歴
  resources :purchase_histories, only: [:index, :create]
  get "/order_completed", to: "purchase_histories#order_completed"


  # 寄付先 寄付履歴
  resources :sc_groups, only: [:new, :create, :edit, :update] do
    resources :donation_histories, only: :create
  end

  resources :donation_histories, only: :index
  get "/donation_completed", to: "donation_histories#donation_completed"
end
