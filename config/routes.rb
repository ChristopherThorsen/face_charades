Rails.application.routes.draw do
  root to: "sessions#new"
  resource :dashboard, only: [:show]
  resource :session, only: [:destroy]
  resources :cards, only: [] do
    resources :rounds, only: [:new, :show, :create]
  end
  resources :users, only: [:show] do
    resource :friendship_request, only: [:create]
    resource :accepted_friendship, only: [:create]
  end
  resources :rounds, only: [:show] do
    resources :guesses, only:[:new, :create]
    resources :photos, only:[:new, :create]
  end

  get "/sessions", to: "sessions#create"
  get "/users", to: "users#create"
end
