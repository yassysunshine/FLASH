Rails.application.routes.draw do
  resources :seeds
  get 'sessions/new'
  root to: 'sessions#new'
  resources :ideas do
    collection do
      post :confirm
      get 'search', to: 'ideas#search'
    end
  end
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy, :show]
  resources :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
