
Rails.application.routes.draw do


  # get 'admin/index'

  # get 'aboutus/index'

<<<<<<< HEAD
=======
   #  namespace :admin do
  #      get 'products/index'
  #     end
>>>>>>> 218028cb4c29a1225f085323ff716b3f5eb813c9

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

<<<<<<< HEAD

=======
  get 'userprofile/index' 
>>>>>>> 218028cb4c29a1225f085323ff716b3f5eb813c9

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
  # resources :product_detail
  resources :search
  resources :aboutus
  resources :auth
  resources :contact
  resources :checkout
  resources :userprofile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
