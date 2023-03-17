Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  root to: "home#index"

  resources :users, only: [:show, :edit, :update]
end
