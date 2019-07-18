Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :countries, only: [:create, :index]
      resources :projects, only: [:create, :index]
      post '/fetch_projects', to: 'projects#fetch'
    end
  end
end
