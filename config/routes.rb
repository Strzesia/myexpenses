Rails.application.routes.draw do
  root 'expenses#new'

  resources :expenses
  resources :categories
  resources :users
  get 'expenses-data', to: 'expenses#load'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
