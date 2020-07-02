Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static#index"
  
  get '/analytics' => "static#show", as: "analytics"
  get '/register' => 'users#new', as: "register"
  get '/profile' => 'users#show', as: "user"

  get '/login' => 'sessions#new', as: "login"
  post '/login' => 'sessions#create'
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :users, only: [:create]
  resources :tests, only: [:show, :new, :create]
  resources :visits, only: [:show, :new, :create]



end
