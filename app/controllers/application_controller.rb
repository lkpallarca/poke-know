class ApplicationController < ActionController::Base
  before_action :check_params
  rescue_from JSON::ParserError, with: :invalid_params
  rescue_from Errno::ENOENT, with: :invalid_params

  private

  def check_params
    unless params[:p].present?
      redirect_to root_path
    end
  end

  def invalid_params
    redirect_to root_path, alert: "Your search keyword did not return any results."
  end
end
