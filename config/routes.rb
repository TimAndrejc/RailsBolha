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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  get '*path', to: 'errors#not_found'
  get '/search', to: 'search#index', as: 'search'
  Rails.application.routes.draw do
    resources :convos, only: [:create]
  end
  
end

Rails.application.routes.draw do

end