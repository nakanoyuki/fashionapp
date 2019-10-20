Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'
  resources :item, only: [:index, :show]


  # get 'cards/new'
  post '/pay' => "cards#pay"
    
  resources  :cards do
    collection do
      post 'pay/:id' => 'cards#pay', as: 'pay'
    end
  end
  

end
