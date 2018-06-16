class ApplicationController < ActionController::Base

  include SessionsHelper
  include TeamsHelper

  private

  def required_user_logged_in
    unless logged_in?
      redirect_to root_url
    end
  end
end
