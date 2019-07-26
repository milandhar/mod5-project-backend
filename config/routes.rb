Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :update]
      resources :countries, only: [:create, :index]
      resources :projects, only: [:create, :index]
      resources :themes, only: [:create, :index]
      resources :organizations, only: [:create, :index]
      resources :user_starred_projects, only: [:index, :create]
      resources :project_donation_options, only: [:index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/fetch_projects', to: 'projects#fetch'
      get '/get_project_count', to: 'countries#get_project_count'
      post '/get_project_theme_count', to: 'countries#get_project_theme_count'
      get '/find_last_project', to: 'projects#find_last_project'
      get '/get_projects', to: 'countries#get_projects'
      post '/check_star', to: 'users#check_star'
      post '/get_user_projects', to: 'users#get_projects'
    end
  end
end
