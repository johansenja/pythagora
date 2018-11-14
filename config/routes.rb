Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :jobs do
    # in order for a developer to bid on a specific job
    get 'bids/new', to: 'bids#new'
    get 'bids/create', to: 'bids#new'
  end
  resources :users, only: [:index, :show] do
    get '/buyer_dashboard', to: 'jobs#buyer_jobs'
    get '/developer_dashboard', to: 'jobs#developer_jobs'
    # In order for a buyer to add a bid for a certain developer
    get 'bids/new', to: 'bids#new'
    get 'bids/create', to: 'bids#create'
  end
  # all other bid routes, all relating to the current_user's bids
  resources :bids, only: [:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
