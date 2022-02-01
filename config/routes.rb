Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users
  get 'logout', to: 'pages#logout', as: 'logout'

  # devise_scope :user do
  #   get 'signup', to: 'devise/registrations#new'
  #   get 'login', to: 'devise/sessions#new'
  # end

  resources :dashboard, only: [:index]
  resources :account, only: [:index, :update]
  resources :billing_portal, only: [:create]
  match '/billing_portal' => 'billing_portal#create', via: [:get]
  match '/cancel' => 'billing_portal#destroy', via: [:get]

  # static pages
  get 'terms', to: 'pages#terms'
  get 'privacy', to: 'pages#privacy'

  # admin panels
  authenticated :user, -> user { user.admin? }  do
    get 'admin', to: 'admin#index', as: 'admin'
    get 'admin/impersonate', to: 'admin#impersonate', as: 'impersonate_user'
  end
end
