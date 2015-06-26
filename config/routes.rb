Rails.application.routes.draw do
  root to: 'welcome#index'
	devise_for :users
  get 'welcome/index'
  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy, :update]
  end
end