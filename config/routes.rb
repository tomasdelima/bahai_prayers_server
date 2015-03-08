BahaiPrayersServer::Application.routes.draw do
  devise_for :users
  resources :prayers, only: :index
  resources :categories, only: [:index, :show] do
    resources :prayers
  end

  get  'mobile_errors',      to: 'mobile_errors#create'
  post 'categories',         to: 'categories#update'
  post 'prayers',            to: 'prayers#update'
  post 'categories/prayers', to: 'prayers#update'
end