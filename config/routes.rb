Rails.application.routes.draw do
  root "products#index"
  resources :products
  resources :users do
    collection do
      get :logout
    end
  end
end
