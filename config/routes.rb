Rails.application.routes.draw do
  root to: "sessions#new"
  resources :facebook_friends, only: [:index]
  resource :dashboard, only: [:show]
  resource :session, only: [:destroy]
  resources :cards, only: [] do
    resources :rounds, only: [:new, :show, :create]
  end
  resources :users, only: [:show, :index, :edit, :update] do
    resource :friendship_request, only: [:create]
    resource :accepted_friendship, only: [:create]
  end
  resources :rounds, only: [:show] do
    resources :guesses, only:[:new, :create, :update]
    resources :photos, only:[:new, :create]
    resource :result, only: [:show]
  end

  get "/sessions", to: "sessions#create"
  get "/users", to: "users#create"
end
