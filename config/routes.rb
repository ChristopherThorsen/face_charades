Rails.application.routes.draw do
  root to: "sessions#new"
  resources :sessions, only:[:create, :new]
  resources :users, only:[:create, :edit, :update]
  resource :dashboard, only: [:show]
  get "/sessions", to: "sessions#create"
  get "/users", to: "users#create"
end
