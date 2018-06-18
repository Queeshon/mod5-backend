Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update, :destroy]
      resources :battles, only: [:index, :create]
      resources :likes, only: [:create]
      post '/sessions/', to: 'sessions#create'
    end
  end
end
