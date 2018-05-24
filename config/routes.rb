Rails.application.routes.draw do

  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]

  resources :teams, only: [:index, :show, :new, :create] do
    resources :users, except: [:index, :show]
    resources :articles

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end
end
