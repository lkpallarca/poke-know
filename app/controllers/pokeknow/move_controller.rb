class Pokeknow::MoveController < ApplicationController
  def show
    poke = Pokeapi::Move.new
    @specific_move = poke.get_move(params[:p].downcase.parameterize)
  end
end