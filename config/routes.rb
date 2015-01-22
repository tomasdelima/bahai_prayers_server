BahaiPrayersServer::Application.routes.draw do
  resources :prayers, only: :index
  resources :categories, only: :index
end
