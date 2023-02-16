Rails.application.routes.draw do
  resources :messages
  resources :convos
  devise_for :users
  resources :posts do
    member do
      put :sold
      put :unsold
    end
  end
  root "posts#index"
  Rails.application.routes.draw do
    resources :convos, only: [:create]
  end
  get '*path', to: 'errors#not_found'

  
end
