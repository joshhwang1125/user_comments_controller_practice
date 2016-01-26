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

  #Contacts
  resources :contacts, only: [:create, :update, :destroy, :show]
  #Contact Shares
  resources :contact_shares, only: [:create, :destroy]

  resources :users do
    resources :contacts, only: [:index]
  end
end
