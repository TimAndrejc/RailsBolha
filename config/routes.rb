Rails.application.routes.draw do
  resources :messages
  resources :convos
  devise_for :users,
  controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
 }
  resources :posts do
    member do
      put :sold
      put :unsold
      put :confirm
    end
  end

  root "posts#index"
  resources :convos, only: [:create]

  get '/rails/active_storage/disk/:encoded_key/*filename', to: 'active_storage/disk#show'
  get 'MyPosts', to: 'posts#myposts', as: 'myposts'
  get 'admin', to: 'posts#admin', as: 'admin'

  #get '*path', to: 'errors#not_found'

  
end
