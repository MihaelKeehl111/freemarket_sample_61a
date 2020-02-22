Rails.application.routes.draw do
  devise_for :users 
  root "products#index"

  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy" 
  end

  resources :signup do
    collection do
      get 'register_user_info'
      post 'register_cellphone'
      post 'register_address'
      post 'register_card'
      get 'complete_registration'
    end
  end

  resources :products, only: [:index, :new]

  resources :users, only: [:index, :edit] do
    collection do
      get :identification
      get :logout
      get :card 
    end
  end

end
