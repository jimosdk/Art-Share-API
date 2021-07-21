Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users ,only: [:index,:create,:destroy,:update,:show] do
    resources :artworks,only: [:index]
  end
  # get 'users', to: 'users#index',as: 'users'
  # post 'users', to: 'users#create'#,as: 'users'
  # get 'users/new', to: 'users#new',as: 'new_user'
  # get 'users/:id/edit',to: 'users#edit',as: 'edit_user'
  # get 'users/:id', to: 'users#show' ,as: 'user'
  # patch 'users/:id',to: 'users#update'#,as: 'user'
  # put 'users/:id',to: 'users#update'#,as: 'user'
  # delete 'users/:id',to: 'users#destroy'#,as: 'user'

  resources :artworks,only: [:create,:show,:update,:destroy]

  resources :artwork_shares,only: [:create,:destroy]
end
