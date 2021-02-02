Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  post "active", to: "users#active"
  delete "logout", to: "sessions#destroy"

  resources :users
  resources :documents
end
