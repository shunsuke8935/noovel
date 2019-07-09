Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'novels#index'
  resources :users, only: [:edit, :show, :update, :destroy]
  resources :novels, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :pages, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  resources :favorites, only: [:index, :create, :destroy]
  resources :histories, only: [:index, :create, :destroy]
  resources :clips, only: [:index, :create, :destroy]
  resources :clip_writers, only: [:index, :create, :destroy]
end
