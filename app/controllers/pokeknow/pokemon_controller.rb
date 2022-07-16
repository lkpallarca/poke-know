class Pokeknow::PokemonController < ApplicationController
  def index
    poke = Pokemon::Api::Client.new
    @specific_pokemon = poke.pokemon(params[:p].to_s)
  end
end