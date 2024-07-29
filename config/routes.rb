Rails.application.routes.draw do
  resources :users
  post '/users/auth', to: 'users#auth'
end
