class Pokeknow::TypeController < ApplicationController
  def show
    poke_type = Pokeapi::Type.new
    @specific_type = poke_type.get_type(params[:p].downcase.parameterize)
  end
end