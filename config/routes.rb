Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :jobs do
    # in order for a developer to bid on a specific job
    get 'bids/new', to: 'bids#new_job'
    post 'bids/create', to: 'bids#create'
    # member do
    #   get 'assign_job'
    # end
  end
  patch 'jobs/:id/assign_job', to: 'jobs#assign_job', as: :assign_job

  resources :users, only: [:index, :show] do
    get '/buyer_dashboard', to: 'jobs#buyer_jobs'
    get '/developer_dashboard', to: 'jobs#developer_jobs'
    # In order for a buyer to add a bid for a certain developer
    get 'bids/new', to: 'bids#new_developer'
    post 'bids/create', to: 'bids#create'
  end
  post 'log_in', to: 'users#custom_sign_in'
  # all other bid routes, all relating to the current_user's bids
  resources :bids, only: [:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
