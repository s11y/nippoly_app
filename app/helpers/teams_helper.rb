module TeamsHelper

  include SessionsHelper

  def current_team
    @current_team ||= current_user.team
  end
end
