Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  
  # resources :users, only: [:create, :destroy, :index, :show, :update]
  # 
  # resources :artworks, only: [:create, :destroy, :index, :show, :update]
  
  resources :artwork_shares, only: [:create, :destroy]
  
  resources :users, except: [:new, :update] do
    resources :artworks, only: :index
    resources :comments, only: :index
  end
  
  resources :artworks, except: [:new, :update] do
    resources :comments, only: :index
  end
  
end
