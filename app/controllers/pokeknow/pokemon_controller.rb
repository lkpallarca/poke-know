class Pokeknow::PokemonController < ApplicationController
  def show
    poke = Pokeapi::Pokemon.new
    @specific_pokemon = poke.get_pokemon(params[:p].downcase.parameterize)
  end
end