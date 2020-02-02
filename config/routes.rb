Rails.application.routes.draw do
  # root "products#index"
  root "users#edit"
  resources :products
  resources :users
end
