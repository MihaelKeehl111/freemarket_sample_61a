Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :signup do
    collection do
      get 'step1'
      post 'step1'
      get 'step2'
      post 'step2'
      get 'step3'
      get 'step4'
      get 'done'
    end
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
