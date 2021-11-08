Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  get '/beginner_moves', to: 'move_tutorials#beginner'

  root to: 'welcome#home'
  get '/home', to: 'welcome#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/profile/:id', to: 'users#show', as: 'profile'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy"

  resources :comments
  resources :users do
    resources :move_tutorials
  end
  resources :move_tutorials do
    resources :comments
  end 
  resources :categories, only: [:index, :show] do
    resources :move_tutorials do
      resources :comments
    end
  end



  

end
