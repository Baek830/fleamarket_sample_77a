Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'delivery_addresses', to: 'users/registrations#new_delivery_address'
    post 'delivery_addresses', to: 'users/registrations#create_delivery_address'
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get "logout"
      get "favorite"
    end
  end

  namespace :products do
    resources :searches, only: :index
  end

  root 'products#index'
  resources :products do
    resources :favorites, only: [:create, :destroy] 
    resources :comments, only: [:create, :destroy]
    collection do
      get 'done', to:'items#done'
      get 'category_children'
      get 'category_grandchildren'
    end
    member do
      get "purchase"
      post "pay"
    end
  end

  root 'categories#index'
  resources :categories do
    collection do
      get :search
    end
  end

end