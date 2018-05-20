class TeamsController < ApplicationController
  def index
    if params[:team_name]
    else
      @team = Team.new
    end
  end

  def show
    # TODO: あとでログインしているユーザーのTeamにする
    @team = Team.new
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      flash[:success] = 'チームを作成しました'
      redirect_to new_team_user_path(@team)
    else
      flash.now[:danger] = 'チームを作成できませんでした'
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
