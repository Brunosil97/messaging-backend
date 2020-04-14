Rails.application.routes.draw do
  resources :user_in_chats
  resources :messages
  resources :chats
  resources :users

  post "/sign-in", to: "users#sign_in"
  get "/validate", to: "users#validate"
  get "/items", to: "users#items"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
