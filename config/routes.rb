Rails.application.routes.draw do
  root "home#index"

  resources :providers
  resources :banks
end
