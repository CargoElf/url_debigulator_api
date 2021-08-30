Rails.application.routes.draw do
  resources :users, only: [:create, :show]

  resource :link, only: :create

  get '/:id', to: 'short_url_list#show'
  post 'authenticate', to: 'authentication#create'
end
