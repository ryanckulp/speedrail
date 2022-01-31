Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users
  get 'logout', to: 'pages#logout', as: 'logout'

  # static pages
  get 'terms', to: 'pages#terms'
  get 'privacy', to: 'pages#privacy'
end
