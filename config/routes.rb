Rails.application.routes.draw do
  root 'pages#home'

  resources :dashboard, only: [:index]

  # payments
  resources :charges, only: [:create, :destroy]

  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get 'signup', to: "registrations#new", as: 'signup'
    post 'users', to: 'users#create', as: 'registrations'
    get 'login', to: "sessions#new", as: 'login'
    get 'profile', to: "registrations#edit", as: 'profile'
    match 'logout', to: "sessions#destroy", as: 'logout', via: [:get, :delete]
  end
end
