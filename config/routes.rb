BahaiPrayersServer::Application.routes.draw do
  resources :prayers, only: :index
  resources :categories, only: :index do
    resources :prayers
  end
end