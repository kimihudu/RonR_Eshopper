Rails.application.routes.draw do
  # namespace :admin do
  #   get 'product/index'
  # end

  # namespace :admin do
  #   get 'product/show'
  # end

  # namespace :admin do
  #   get 'product/edit'
  # end

  # namespace :admin do
  #   get 'product/delete'
  # end

  # namespace :admin do
  #   get 'product/new'
  # end

  # namespace :admin do
  #   get 'category/index'
  # end

  # namespace :admin do
  #   get 'category/show'
  # end

  # namespace :admin do
  #   get 'category/edit'
  # end

  # namespace :admin do
  #   get 'category/delete'
  # end

  # namespace :admin do
  #   get 'category/new'
  # end

  # get 'admin/index'

  # get 'admin/edit'

  # get 'admin/delete'

  # get 'admin/new'

  root to: 'home#index'

    namespace :admin do
      resources :categories
      resources :products
    end
  # resources :checkout
  # resources :home
  resources :products
  # resources :product_detail
  resources :auth
  resources :contact
  resources :checkout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
