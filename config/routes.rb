BahaiPrayersServer::Application.routes.draw do
  # devise_for :users
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :prayers, only: :index
  resources :categories, only: [:index, :show] do
    resources :prayers
  end
  resources :books, only: [:index, :show]
  resources :facts, only: [:index]

  get  'mobile_errors',      to: 'mobile_errors#create'
  post 'categories',         to: 'categories#update'
  post 'prayers',            to: 'prayers#update'
  post 'categories/prayers', to: 'prayers#update'
  post 'book',               to: 'books#update'
end