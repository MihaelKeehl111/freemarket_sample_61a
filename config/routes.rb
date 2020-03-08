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

  resources :products, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get :completion
      get :exhibiting
      get :trading
      get :sold
      get :purchase
      get :purchased
    end
    member do
      put :stop_selling
      put :reselling
    end
  end

  resources :categories, only: [:index, :show]

  resources :users, only: [:index, :edit, :update] do
    collection do
      get :identification
      get :change_password
      get :check_cellphone
      get :change_address
      get :logout
      get :card 
    end
  end

end
