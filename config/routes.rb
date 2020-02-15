Rails.application.routes.draw do
  devise_for :users 
  root "products#index"

  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy" 
  end

  resources :signup do
    collection do
      get 'step1'
      post 'step2'
      post 'step3'
      post 'step4'
      get 'done'
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
