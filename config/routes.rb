Rails.application.routes.draw do
  root to: "logins#new"

  get 'login', to: 'logins#new'
  get 'login/destroy', to:'logins#destroy'
  get 'googlelogin/create', to:'googlelogins#create', as: :create_google_login
  post 'login', to: 'logins#create'
  
  resources :users
end
