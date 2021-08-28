Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]
end
