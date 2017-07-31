
Rails.application.routes.draw do


  namespace :admin do
    get 'profile/index'
  end

  namespace :admin do
    get 'profile/show'
  end

  namespace :admin do
    get 'profile/new'
  end

  namespace :admin do
    get 'profile/edit'
  end

  # get 'admin/index'

  # get 'aboutus/index'

   #  namespace :admin do
  #      get 'products/index'
  #     end

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

  #  namespace :admin do
  #   get 'categories/edit'
  #  end

  # namespace :admin do
  #   get 'categories/delete'
  # end

  #  namespace :admin do
  #    get 'categories/new'
  #  end


  get 'userprofile/index'

  root to: 'home#index'

    namespace :admin do
      resources :categories
      resources :products
    end
    namespace :auth do

    end
  # resources :checkout
  # resources :homeexit
  resources :products
  resources :product_detail
  resources :search
  resources :aboutus
  resources :auth
  resources :contact
  resources :checkout
  resources :userprofile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
