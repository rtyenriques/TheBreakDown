Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#home'
  get '/home', to: 'welcome#home'

  get '/signup', to: 'users#new', as: 'user'
  post '/signup', to: 'users#create'
  get '/profile/:id', to: 'users#show', as: 'profile'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy"

  resources :users
end
