Rails.application.routes.draw do
  root "users#show"
  resources :products
  resources :users
end
