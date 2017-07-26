<<<<<<< HEAD
<<<<<<< HEAD
Rails.application.routes.draw do
  # get 'aboutus/index'

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
  # resources :homeexit

  resources :products
  # resources :product_detail
  resources :aboutus
  resources :auth
  resources :contact
  resources :checkout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
=======
<<<<<<< HEAD
=======
>>>>>>> d56e174014aa4578e423d0ce6a55d4cc978e706f
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
<<<<<<< HEAD
=======
Rails.application.routes.draw do
  get 'aboutus/index'

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

  root to: 'product_detail#index'

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
>>>>>>> 848441ec1ddcee751fb194112b30a5dde167411e
>>>>>>> 6c021309e0789ed0e3c32b2efd8e221a8555bbe1
=======
>>>>>>> d56e174014aa4578e423d0ce6a55d4cc978e706f
