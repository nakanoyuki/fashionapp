Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  resources :users, only: [:show]
  resources :items, only: [:index, :show] do
    resources :dealings, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end
