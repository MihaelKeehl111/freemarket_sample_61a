Rails.application.routes.draw do
  root "products#index"

  resources :products, only: [:index]

  resources :users, only: [:index] do
    collection do
      get :identification
    end
  end  
end
