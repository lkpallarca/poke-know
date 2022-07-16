Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pokeknow#index"

  get '/pokemon', to: "pokemon#index", as: "pokemon"
  get '/item', to: "item#index", as: "item"
end
