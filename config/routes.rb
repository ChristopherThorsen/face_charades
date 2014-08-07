Rails.application.routes.draw do
  root to: "sessions#new"
  resource :dashboard, only: [:show]
  resource :session, only: [:destroy]
  resources :users, only: [:show] do
    resource :friendship_request, only: [:create]
    resource :accepted_friendship, only: [:create]
  end

  get "/sessions", to: "sessions#create"
  get "/users", to: "users#create"
end
