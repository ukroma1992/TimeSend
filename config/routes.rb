Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'connections#create'
  resources :connections, only: [:destroy]
  get 'auth/failure', to: 'connections#omniauth_failure'

  get 'connections/create'

  get 'connections/destroy'

  devise_for :users, controllers: {registrations: 'registrations'}
  root 'pages#home'
  get 'dashboard', to: "pages#dashboard"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
