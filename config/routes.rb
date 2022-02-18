Rails.application.routes.draw do
  root 'landing#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  get '/discover', to: 'movies#index'

  get '/movies/:movie_id/parties/new', to: 'parties#new'


  resources :users, only: [:new, :create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :parties, only: [:new, :create]
    end
  end
end
