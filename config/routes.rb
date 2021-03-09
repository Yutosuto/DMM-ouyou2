Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "homes#top"
  get "home/about" => "homes#about"

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
  resources :users, only: [:index, :show, :edit, :update]
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end
   resources :users, only: [:index, :show, :edit, :update]
   resources :relationships
  	post 'follow/:id' => 'relationships#follow', as: 'follow'
  	delete 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  	get 'my_followings' => "relationships#followings"
  	get 'my_followers' => "relationships#followers"
  	get 'search' => "search#search"
end
