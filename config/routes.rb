Rails.application.routes.draw do
  #root 'requests#index'
  root 'audios#search'
  get '/audios' => 'audios#search'
  #get '/audios', to:'audios#index'
  #get '/audios', to:'audios#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
