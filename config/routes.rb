Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :products, only: [:index]

  resources :users, only: [:index, :edit] do
    collection do
      get :logout
    end
  end
end
