Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      resources :countries, only: [:create, :index]
      resources :projects, only: [:create, :index]
      resources :themes, only: [:create, :index]
      resources :organizations, only: [:create, :index]
      resources :user_starred_projects, only: [:index]
      resources :project_donation_options, only: [:index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/fetch_projects', to: 'projects#fetch'
      get '/get_project_count', to: 'countries#get_project_count'
    end
  end
end
