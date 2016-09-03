Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'root#index'

  resources :restaurants, only: [:index, :show, :create, :update]
  resources :groups, :users

  resources :lists do
    resources :list_restaurants, only: [:show, :create, :update, :destroy] do
      resources :list_experiences,  only: [:show, :create, :update, :destroy]
    end
  end

end
