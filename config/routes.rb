Rails.application.routes.draw do
  resources :refresh_tokens
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: :create

  resources :sessions, only: :create

end
