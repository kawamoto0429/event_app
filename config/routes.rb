Rails.application.routes.draw do

  root  'users#home'
  get    '/signup',  to: 'users#new'
  resources :users do
    resources :profiles
  end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
 
  resources :events do
    resources :comments, only: [:create, :destroy, :show] do
      post 'reply', to: 'comments#reply'
    end
    resources :jevents, only: [:create, :destroy]
  end
  resources :circles do 
    resources :jcircles, only: [:create, :destroy]
    
  end
   get 'genre', to: 'events#genre'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
