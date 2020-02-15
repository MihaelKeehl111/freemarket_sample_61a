Rails.application.routes.draw do
  root "products#index"

  resources :products, only: [:index, :new, :show]

  resources :users, only: [:index, :edit] do
    collection do
      get :logout
      get :card
    end
  end
end
