Rails.application.routes.draw do

  get 'serch/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'novels#index'
  resources :users, only: [:edit, :show, :update, :destroy] do
    resources :histories, only: [:index, :create, :destroy]
    resources :clips, only: [:index]
  end
  get 'tags/:tag', to: 'serch#tag', as: :tag
  resources :novels, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :pages, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :clips, only: [:create, :destroy]
  end
  resources :favorites, only: [:index]

  resources :clip_writers, only: [:index, :create, :destroy]
end
