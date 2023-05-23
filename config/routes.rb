Rails.application.routes.draw do
  root to: "logins#new"

  get 'login', to: 'logins#new'
  get 'login/destroy', to:'logins#destroy'
  post 'login', to: 'logins#create'
  
  resources :users
end
