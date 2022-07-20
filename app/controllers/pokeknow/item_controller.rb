class Pokeknow::ItemController < ApplicationController
  def show
    poke = Pokeapi::Item.new
    @specific_item = poke.get_item(params[:p].downcase.parameterize)
  end
end