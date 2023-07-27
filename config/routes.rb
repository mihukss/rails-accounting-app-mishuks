Rails.application.routes.draw do
  root to: 'auth/logins#new'

  get 'login', to: 'auth/logins#new'
  get 'logout', to: 'auth/logins#destroy', as: 'logout'
  get 'googlelogin/create', to: 'googlelogins#create', as: :create_google_login
  post 'login', to: 'auth/logins#create'
  get 'users/:id/destroy', to: 'users#destroy', as: 'delete_user'
  # post 'users', to: 'users#update', as: 'update_user'

  resources :users
  resources :employees
  resources :reset_password, only: %i[edit update]
end
