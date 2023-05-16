Rails.application.routes.draw do
  get 'login', to: 'logins#new'

  resources :users
end
