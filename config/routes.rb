Rails.application.routes.draw do

  root 'articles#index'

  resources :articles
  resources :messages
  resources :sessions, only: [:new, :create, :destroy]
  resources :user,     only: [:show]

  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/admin',   to: 'user#admin_show',  via: 'get'

end
