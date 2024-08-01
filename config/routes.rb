Rails.application.routes.draw do
  resources :carts do
    member do
      post 'add_item'
      post 'remove_item'
    end
  end
  resources :items
  resources :users
  post '/users/auth', to: 'users#auth'
end
