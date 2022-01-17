Rails.application.routes.draw do

  root  'users#home'
  get    '/signup',  to: 'users#new'
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
 
  resources :events,          only: [:index,:show, :new, :create, :destroy ] do
    resources :comments, only: [:create, :destroy, :show] do
      post 'reply', to: 'comments#reply'
    end
    resources :jevents, only: [:create, :destroy]
  end
  resources :circles,          only: [:index,:show, :new, :create, :destroy] do 
    resources :jcircles, only: [:create, :destroy]
    
  end
   get 'genre', to: 'events#genre'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
