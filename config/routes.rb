Rails.application.routes.draw do
  root "home#index"
  get "multiselect", to: "home#index"

  resources :ingredientes, only: [:index]
end
