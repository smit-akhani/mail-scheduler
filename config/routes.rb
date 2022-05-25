Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  root "emails#new"
  
  post "/", to:"emails#create", as: "create"
  
  resources :emails
end
