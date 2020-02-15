Rails.application.routes.draw do
  root "products#buy"

  resources :products, only: [:index, :new] do
    collection do
      get :buy
    end
  end  


  resources :users, only: [:index, :edit] do
    collection do
      get :logout
      get :card
    end
  end
end
