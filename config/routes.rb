Rails.application.routes.draw do
  resources :user_in_chats
  resources :messages
  resources :chats
  resources :users
  resources :sessions
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
