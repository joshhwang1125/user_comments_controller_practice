Rails.application.routes.draw do
  #resources :users
  #USERS
  get 'users' => 'users#index'
  post 'users' => 'users#create'

  #USER/ID

  get 'users/:id' => 'users#show', :as => 'user'
  patch 'users/:id' => 'users#update'
  put 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  resources :contacts, only: [:index, :create, :update, :destroy, :show]
end
