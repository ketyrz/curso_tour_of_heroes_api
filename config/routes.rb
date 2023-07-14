Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :heroes, only: [:create]
  end
  get '/api/heroes/:id', to: 'api/heroes#show', as: 'api_hero_url'
end
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"