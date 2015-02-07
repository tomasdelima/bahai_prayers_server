BahaiPrayersServer::Application.routes.draw do
  resources :prayers, only: :index
  resources :categories, only: [:index, :show] do
    resources :prayers
  end

  post 'categories', to: 'categories#update'
end