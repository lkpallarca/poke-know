class Pokeknow::ItemController < ApplicationController
  def index
    poke = Pokemon::Api::Client.new
    @specific_item = poke.item(params[:p].parameterize)
  end
end