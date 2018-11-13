Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :jobs
  resources :users, only: [:index, :show] do
    get '/buyer_dashboard', to: 'jobs#buyer_jobs'
    get '/developer_dashboard', to: 'jobs#developer_jobs'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
