Rails.application.routes.draw do
  get '/:id', to: 'short_url_list#show'
  resources :users, only: [:create, :show]
  post 'authenticate', to: 'authentication#create'
end
