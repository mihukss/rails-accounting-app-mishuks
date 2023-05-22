Rails.application.routes.draw do
  root to: "logins#new"

  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'

  
  resources :users
end
