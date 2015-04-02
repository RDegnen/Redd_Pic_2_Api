Rails.application.routes.draw do
  resources :imgurs, only: [:index, :create]
end
