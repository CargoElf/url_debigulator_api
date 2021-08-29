Rails.application.routes.draw do
  resources :users, only: [:create, :show]

  resources :users do
    resource :link, only: [:create]
  end

  get '/:id', to: 'short_url_list#show'
  post 'authenticate', to: 'authentication#create'
end
