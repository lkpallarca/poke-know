class Pokeknow::MachineController < ApplicationController
  before_action :check_machine_params

  def show
    poke_machine = Pokeapi::Machine.new
    @specific_machine = poke_machine.get_machine(params[:p].downcase)
  end

  private

  def check_machine_params
    regex = Regexp.new('^tm[0-9]+$', Regexp::IGNORECASE)
    unless params[:p].to_s.match? regex
      redirect_to root_path, alert: 'Your search keyword did not return any results. Example: tm01'
    end
  end
end