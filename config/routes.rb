Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  #フォロー中のユーザーとフォローされているユーザ一覧を表示するためのルーティング
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings#/users/:id/followingsというURL（:idをもつユーザのフォローユーザー一覧が表示）が生成される。
      get :followers#/users/:id/followersというURL（:idをもつユーザのフォロアーユーザー一覧が表示）が生成される。
      get :likes
    end
    # collection do
    #   get :search
    # end
  end
  
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]#ログインユーザーがユーザをフォロー／アンフォロー出来るルーティング
  resources :fevorites, only: [:create, :destroy]
end
