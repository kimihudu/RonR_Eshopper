Rails.application.routes.draw do
  

  # namespace :admin do
  #    get 'products/index'
  #   end

  #  namespace :admin do
  # get 'products/show'
  #   end

  #  namespace :admin do
  #   get 'products/edit'
  #  end

  # namespace :admin do
  #   get 'products/delete'
  # end

  # namespace :admin do
  #   get 'products/new'
  # end

  #  namespace :admin do
  #    get 'categories/index'
  #  end

  # namespace :admin do
  #   get 'categories/show'
  # end

   namespace :admin do
     get 'categories/edit'
   end

  # namespace :admin do
  #   get 'categories/delete'
  # end

  # namespace :admin do
  #   get 'categories/new'
  # end

 

  root to: 'home#index'

   namespace :admin do
      resources :categories
      resources :products
   end
  # resources :checkout
  # resources :home
  resources :products
  # resources :product_detail
  # resources :auth
  resources :contact
  resources :checkout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
