Rails.application.routes.draw do
  # Session routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Custom routes
  get '/admin', to: 'home#aindex'
  get '/userhome', to: 'home#uindex'
  get '/your-quotes', to: 'quotes#your_quotes'
  
  # Resources
  resources :quote_categories
  resources :philosophers
  resources :categories
  resources :quotes
  resources :users

  # Root path
  root 'home#index'

  # Other routes
  get 'search', to: 'search#index'
  get 'about', to: 'about#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
