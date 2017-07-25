Rails.application.routes.draw do
  get 'login/index'

  root to: 'auth#login'

  # resources :checkout
  # resources :home
  # resources :products
  # resources :product_detail
  # resources :auth

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
