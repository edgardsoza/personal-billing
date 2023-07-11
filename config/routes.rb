Rails.application.routes.draw do
  root 'splash#index'
  devise_for :users

  get 'splash', to: 'splash#index', as: 'splash'
  get 'login', to: 'sessions#new', as: 'log_in'
  post 'login', to: 'sessions#create'
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  post 'sign_in', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'log_out'
  get 'sign_up', to: 'users#new', as: 'sign_up'
  post 'sign_up', to: 'users#create'
  
  resources :categories, only: [:index, :new, :create, :destroy, :show] do
    resources :transactions, only: [:show, :new, :create]
    resources :category_transactions, only: [:create, :show, :new]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
