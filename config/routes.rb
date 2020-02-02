Rails.application.routes.draw do
  root "products#index"

  resources :products

  resources :users, only: [:index, :edit] do
    collection do
      get :logout
    end
  end
end
