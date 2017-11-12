Rails.application.routes.draw do

  root 'pages#home'
  get 'dashboard', to: "pages#dashboard"

  resources :posts do
    member do
      put :cancel
    end
  end

  authenticated :user, -> user { user.admin? } do
    mount Delayed::Web::Engine, at: '/jobs'
  end


  get 'auth/:provider/callback', to: 'connections#create'
  resources :connections, only: [:destroy]
  get 'auth/failure', to: 'connections#omniauth_failure'
  get 'connections/create'
  get 'connections/destroy'

  devise_for :users, controllers: {registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
