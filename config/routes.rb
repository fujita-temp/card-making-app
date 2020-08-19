Rails.application.routes.draw do
  get 'images/ogp'
  get 'static_pages/home'
  get 'static_pages/help'
  get '/form', to: 'cards#new'
  get '/result', to: 'cards#new'
  post '/result', to: 'cards#result'
  get 'images/ogp.png', to: 'images#ogp'
  root 'static_pages#home'
end