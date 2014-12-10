Rails.application.routes.draw do

  root 'static_pages#home'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  post 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
  
  get '/signup', to: 'profiles#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  get '/home',   to: 'static_pages#home'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pagest#contact'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :authors, path: "", except: [:index, :new, :create]
  resources :profiles
  resources :authentications, only: :destroy
end