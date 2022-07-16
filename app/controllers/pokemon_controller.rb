class PokemonController < ApplicationController
  def index
    poke = Pokemon::Api::Client.new
    @specific_pokemon = poke.pokemon(params[:pokemon_name].to_s)
  end
end