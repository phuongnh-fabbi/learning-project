Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  patch 'admin/users/:id/edit', controller: 'admin/users', action: :update
  root to: "home#index"

  resources :users, only: [:show, :edit, :update]
  resources :words, only: [:show]
  resources :categories, only: [:index, :show]
  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :users do
      collection {post :import}
    end
  end
end
