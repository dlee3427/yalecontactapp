Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "application#index"
  
  get '/analytics' => "application#show"
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/users/:id' => 'users#show', as: "user"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete "/logout", to: "sessions#destroy"

  resources :tests, only: [:show, :new, :create]
  resources :visits, only: [:show, :new, :create]


  

  


end
