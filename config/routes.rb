BahaiPrayersServer::Application.routes.draw do
  devise_for :users
  resources :prayers, only: :index
  resources :categories, only: [:index, :show] do
    resources :prayers
  end

  post 'categories', to: 'categories#update'
  post 'prayers',    to: 'prayers#update'
  post 'categories/prayers',    to: 'prayers#update'
end