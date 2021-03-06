Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'users', to: 'users#index',as: 'users'
  # post 'users', to: 'users#create'#,as: 'users'
  # get 'users/new', to: 'users#new',as: 'new_user'
  # get 'users/:id/edit',to: 'users#edit',as: 'edit_user'
  # get 'users/:id', to: 'users#show' ,as: 'user'
  # patch 'users/:id',to: 'users#update'#,as: 'user'
  # put 'users/:id',to: 'users#update'#,as: 'user'
  # delete 'users/:id',to: 'users#destroy'#,as: 'user'

  resources :users ,only: [:index,:create,:destroy,:update,:show] do
    resources :artworks,only: [:index] do 
      get 'favorite_artworks' ,on: :collection
    end
    resources :collections,only: [:index]
  end
  get 'users/:user_id/liked_comments', to: 'comments#liked_comments', as: 'liked_comments'
  get 'users/:user_id/liked_artworks', to: 'artworks#liked_artworks', as: 'liked_artworks'


  resources :artworks,only: [:create,:show,:update,:destroy] do
    resources :collections,only: [:index]
  end
  get 'artworks/:artwork_id/artwork_likers', to: 'users#artwork_likers', as: 'artwork_likers'

  resources :artwork_shares,only: [:create,:destroy]

  resources :comments,only: [:index,:create,:destroy]
  get 'comments/:comment_id/comment_likers', to: 'users#comment_likers', as: 'comment_likers'

  resources :likes, only:[:create,:destroy]

  resources :collections,only: [:create,:destroy] do
    resources :artworks,only: [:index]
  end

  resources :saved_artworks, only: [:create,:destroy]
end
