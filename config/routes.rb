Rails.application.routes.draw do
  root "products#index"
  resources :products
<<<<<<< Updated upstream
=======
  
>>>>>>> Stashed changes
  resources :users do
    collection do
      get :logout
    end
  end
end
