BahaiPrayersServer::Application.routes.draw do
  resources :prayers, only: :index
end
