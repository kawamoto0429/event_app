Rails.application.routes.draw do

  root  'users#home'
  get    '/signup',  to: 'users#new'
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :events,          only: [:index,:show, :new, :create, :destroy] do
    resources :jevents, only: [:create, :destroy]
  end
  resources :circles,          only: [:index,:show, :new, :create, :destroy] do 
    resources :jcircles, only: [:create, :destroy]
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
