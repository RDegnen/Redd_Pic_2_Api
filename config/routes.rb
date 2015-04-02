Rails.application.routes.draw do
  resources :imgurs, only: [:index, :create]
  resources :reddits, only: [:index, :create]
end
