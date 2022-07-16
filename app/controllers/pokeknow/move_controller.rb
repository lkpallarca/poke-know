class Pokeknow::MoveController < ApplicationController
  def index
    poke = Pokemon::Api::Client.new
    @specific_move = poke.move(params[:p].parameterize)
  end
end