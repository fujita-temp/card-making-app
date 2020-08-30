Rails.application.routes.draw do
  root 'cards#home'
  get '/form', to: 'cards#new'
  post '/form', to: 'cards#new'
  post '/result', to: 'cards#result'
  get '/download', to: 'cards#download'
  get '/create', to: 'cards#create_image'
end