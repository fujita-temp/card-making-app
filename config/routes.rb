Rails.application.routes.draw do
  get 'sessions/new'
  get 'static_pages/home'
  get 'users/new'
  #root 'cards#home'
  get '/form', to: 'cards#new'
  post '/form', to: 'cards#new'
  post '/result', to: 'cards#result'
  get '/download', to: 'cards#download'
  get '/create', to: 'cards#create_image'



  #以下、railsチュートリアルにのっとる
  root 'users#new'
  get 'likes/create'
  get 'likes/destroy'
  get 'static_pages/home'
  get 'static_pages/help'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :likes,               only: [:create, :destroy]
  

  #rootが変更された時のための保険
  get '/signup', to:'users#new'

  #エラー対応のためコメントアウト
  get   '/home',     to: 'static_pages#home'

end