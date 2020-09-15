Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'delivery_addresses', to: 'users/registrations#new_delivery_address'
    post 'delivery_addresses', to: 'users/registrations#create_delivery_address'
  end

  root 'products#index'
  resources :products do
    collection do
      get 'search'
      get 'category_children'
      get 'category_grandchildren'
    end
  end
  root 'categories#index'
  resources :categories do
    collection do
      get :search
    end
  end
end