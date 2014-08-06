Rails.application.routes.draw do
  root to: "sessions#new"
  resource :dashboard, only: [:show]
  resource :session, only: [:destroy]
  resources :users, only: [:show]
  get "/sessions", to: "sessions#create"
  get "/users", to: "users#create"
end
