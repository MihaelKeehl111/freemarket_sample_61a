Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :signup do
    collection do
      get 'index'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'done'
    end
  end

  resources :products, only: [:index, :new]

  resources :users, only: [:index, :edit] do
    collection do
      get :logout
    end
  end

end
