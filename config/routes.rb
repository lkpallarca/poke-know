Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pokeknow#index"

  namespace :pokeknow do
    resources :pokemon, only: :index
    resources :item, only: :index
    resources :berry, only: :index
    resources :machine, only: :index
    resources :move, only: :index
  end
end
