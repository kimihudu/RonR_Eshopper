
Rails.application.routes.draw do
<<<<<<< HEAD


  # get 'sessions/login,'

  # get 'sessions/home,'

  # get 'sessions/profile,'

  # get 'sessions/setting'

  # get 'users/new'

  # namespace :admin do
  #   get 'profile/index'
  # end

  # namespace :admin do
  #   get 'profile/show'
  # end

  # namespace :admin do
  #   get 'profile/new'
  # end

  # namespace :admin do
  #   get 'profile/edit'
  # end

  # get 'admin/index'

=======
 
 
>>>>>>> 7291cd7ceeea45ef8696ed759156e796e9eadae9
  # get 'aboutus/index'

 namespace :admin do
     get 'products/index'
    end

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

  # get 'userprofile/index'
=======
 
>>>>>>> 7291cd7ceeea45ef8696ed759156e796e9eadae9

  root to: 'home#index'

    namespace :admin do
<<<<<<< HEAD
      resources :categories
      resources :products
    end

=======
    resources :categories
    resources :products
    resources :profile
    
  end
>>>>>>> 7291cd7ceeea45ef8696ed759156e796e9eadae9
  # resources :checkout
  # resources :homeexit

  resources :products
  resources :product_detail
  resources :search
  resources :aboutus
  # resources :auth
  resources :contact
  resources :checkout
<<<<<<< HEAD
  resources :userprofile
  devise_for :users, :controllers => {registrations: 'registrations'} # --> for customize registrations_controller
  # resources :users
=======
>>>>>>> 7291cd7ceeea45ef8696ed759156e796e9eadae9
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
