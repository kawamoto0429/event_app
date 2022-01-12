Rails.application.routes.draw do

  root  'users#home'
  get    '/signup',  to: 'users#new'
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :events,          only: [:index,:show, :new, :create, :destroy]
  resources :circles,          only: [:index,:show, :new, :create, :destroy]
  # get '/events/new', to: 'events#new'
  # post '/events/create', to: 'events#create'
  # delete '/events/delete', to: 'events#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
