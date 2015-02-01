Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root "welcome#show"
  resource :dashboard, only: [:show]

  resources :groups, only: [:new, :create, :show] do
    resources :events, only: [:new, :create]
    resources :invitations, only: [:new, :create, :show, :update]
  end

  resources :events, only: :none do
    resources :boardgame_options, only: [:create]
    resources :rsvps, only: [:create]
  end

  resources :boardgames, only: [:new, :create]

  get "register" => "users#new"
  get "login" => "sessions#new"
end
