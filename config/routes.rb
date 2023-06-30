Rails.application.routes.draw do
  get 'authentication/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/signup', to: 'authentication#signup'
  post '/login', to: 'authentication#login'

  # Defines the root path route ("/")
  # root "articles#index"
end
