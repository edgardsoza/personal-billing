Rails.application.routes.draw do
  root 'splash#index'
  devise_for :users
  get 'splash', to: 'splash#index', as: 'splash'
  get 'login', to: 'sessions#new', as: 'log_in'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'log_out'
  get 'sign_up', to: 'users#new', as: 'sign_up'
  post 'sign_up', to: 'users#create'
  
  resources :categories, only: [:index, :new, :create, :destroy] do
    resources :transactions
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
