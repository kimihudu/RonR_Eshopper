Rails.application.routes.draw do
  get 'admin/index'

  get 'admin/edit'

  get 'admin/delete'

  get 'admin/new'

  root to: 'home#index'

  # resources :checkout
  # resources :home
  # resources :products
  # resources :product_detail
  # resources :auth

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
