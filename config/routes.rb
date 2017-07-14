Rails.application.routes.draw do

  resources :brand, except: [:show]

  get 'brand/index'

  get 'brand/new'

  get 'brand/create'

  get 'brand/edit'

  get 'brand/update'

  get 'brand/destroy'

  root to: "brand#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
