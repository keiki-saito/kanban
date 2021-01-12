Rails.application.routes.draw do
  devise_for :users
 root 'top#index'
  resources :list, only: %i(new create edit update destroy) do
    resources :cards, only: %i(new create show edit update destroy)
  end
 resources :users
end
