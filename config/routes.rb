Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "products#index"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :products, only: [:index, :new]

  resources :users, only: [:index, :edit] do
    collection do
      get :logout
    end
  end

end
