
Rails.application.routes.draw do


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


  # get 'userprofile/index'

  root to: 'home#index'

    namespace :admin do
    resources :admin do
      get 'admin/admin/logout', to: 'admin/admin#destroy', as: :admin_signout
    end
    resources :categories
    resources :products do
      get 'admin/product/:id/addat', to: 'admin/products#addAt'
    end
    resources :profile

  end

  # devise_scope :user do
  #   get '/signout', to: 'devise/sessions#destroy', as: :signout
  # end


  # resources :checkout
  # resources :homeexit

  resources :products
  resources :product_detail
  resources :search
  resources :aboutus
  # resources :auth
  resources :contact
  resources :checkout
  resources :userprofile
  devise_for :users, :controllers => {registrations: 'registrations'} # --> for customize registrations_controller
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
