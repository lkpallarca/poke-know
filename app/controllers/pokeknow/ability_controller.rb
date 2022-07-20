class Pokeknow::AbilityController < ApplicationController
  def show
    poke_ability = Pokeapi::Ability.new
    @specific_ability = poke_ability.get_ability(params[:p].downcase.parameterize)
  end
end