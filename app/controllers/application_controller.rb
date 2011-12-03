class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_timezone_for_user

  
  private
  def set_timezone_for_user
    if user_signed_in?
      Time.zone = current_user.time_zone || Caldron::Application.config.time_zone
    end
  end
end
