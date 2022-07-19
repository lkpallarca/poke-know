Rails.application.routes.draw do
  root "pokeknow#index"

  namespace :pokeknow do
    resources :pokemon, only: :show
    resources :item, only: :show
    resources :berry, only: :show
    resources :machine, only: :show
    resources :move, only: :show
    resources :type, only: :show
    resources :ability, only: :show
  end
end
