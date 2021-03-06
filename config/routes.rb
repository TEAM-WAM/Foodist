Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'root#index'

  get '/add', to: "groups#add"
  get '/search', to: "root#search"
  get '/j/lists/trending', to: 'lists#jtrending'
  get '/j/lists/groups/:id', to: 'lists#jgroup'
  get '/j/lists/:id/comments', to: "comments#jlists"
  get '/j/lists/:id', to: 'lists#jshow'
  get '/j/lists/', to: 'lists#jindex'
  get '/profiles', to: 'profiles#index'

  # put '/lists/:list_id/list_restaurants/:id/updatevisited', to: 'list_restaurants#updatevisited'

  get '/lists/groups/:id/new', to: 'lists#glistsnew'
  # get '/j/restaurants/:id/lists', to: 'list_restaurant#jrestaurantlists'
  get '/j/restaurants/:id/comments', to: "comments#jrestaurants"

  resources :restaurants, only: [:index, :show, :create, :update]
  resources :groups, :users
  resources :profiles, only: [:show, :edit, :update]
  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :votes, only: [:create]

  resources :lists do
    resources :list_restaurants, only: [:show, :create, :update, :destroy] do
      resources :list_experiences,  only: [:show, :create, :update, :destroy]
    end
  end

end
