Rails.application.routes.draw do
  # devise_for :users do
  #   get '/users/sign_out', to: 'devise/sessions#destroy'

  # end
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks' }

  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
