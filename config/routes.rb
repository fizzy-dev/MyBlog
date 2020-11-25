Rails.application.routes.draw do
  root 'static_page#home'
  get '/help', to:'static_page#help'
  get '/home', to:'static_page#home'
  get '/signup',to:'users#new'
  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/logout',  to: 'session#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts,             only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
