Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  post '/mechanics/:id/rides', to: 'ride_mechanics#create'

  get 'parks/:id', to: 'parks#show'
end
