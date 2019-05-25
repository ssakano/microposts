Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
<<<<<<< HEAD
  resources :users, only: [:index, :show, :new, :create]
  
  resources :microposts, only: [:create, :destroy]
=======
  resources :users
>>>>>>> 1d4a42726e2e3869b8c83640a6c84a49edd82336
end
