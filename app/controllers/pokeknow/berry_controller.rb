class Pokeknow::BerryController < ApplicationController
  before_action :check_berry_params

  def index
    poke = Pokemon::Api::Client.new
    @specific_item = poke.item(params[:p].to_s)
  end

  private

  def check_berry_params
    regex = Regexp.new('^[a-zA-Z]+-berry$', Regexp::IGNORECASE)
    unless params[:p].to_s.match? regex
      redirect_to root_path, alert: 'Your search keyword did not return any results. Must include the keyword "-berry"'
    end
  end
end