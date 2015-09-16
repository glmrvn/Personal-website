Rails.application.routes.draw do

  root 'welcome#index'

  resources :articles
  resources :sessions, only: [:new, :create, :destroy]
  resources :user,     only: [:new, :create, :show, :edit, :update] do
    get :nil_see_count_all, on: :collection
  end
  # resources :user,     only: [:show, :new, :create, :destroy, :index ] do
  #   get :nil_see_count_all, on: :collection
  # end

  match '/signin',    to: 'sessions#new',     via: 'get'
  match '/signout',   to: 'sessions#destroy', via: 'delete'
  match '/admin',     to: 'user#admin_show',  via: 'get'
  match '/portfolio', to: 'articles#index',   via: 'get'

end
