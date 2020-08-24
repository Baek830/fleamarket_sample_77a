Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: :show
  resources :products do
    collection do
      get 'search'
    end
  end
end
