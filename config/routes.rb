Rails.application.routes.draw do
  resources :messages
  resources :convos
  devise_for :users
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  get '*path', to: 'errors#not_found'
  Rails.application.routes.draw do
    resources :convos, only: [:create]
  end
  
end
