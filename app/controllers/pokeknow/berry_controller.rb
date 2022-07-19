class Pokeknow::BerryController < ApplicationController
  before_action :check_berry_params

  def show
    poke_berry = Pokeapi::Berry.new
    @specific_berry = poke_berry.get_berry(params[:p])
  end

  private

  def check_berry_params
    regex = Regexp.new('^[a-zA-Z]+-berry$', Regexp::IGNORECASE)
    unless params[:p].to_s.match? regex
      redirect_to root_path, alert: 'Your search keyword did not return any results. Must include the keyword "-berry"'
    end
  end
end