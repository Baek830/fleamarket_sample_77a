Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'delivery_addresses', to: 'users/registrations#new_delivery_address'
    post 'delivery_addresses', to: 'users/registrations#create_delivery_address'
  end

  resources :users, only: [:new, :show, :edit, :update] do
    member do
      get "logout"
      get "favorite"
    end
  end

  root 'products#index'
  resources :products do
    resources :favorites, only: [:create, :destroy] do
    end
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