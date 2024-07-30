Rails.application.routes.draw do
  resources :items
  resources :users
  post '/users/auth', to: 'users#auth'
end
