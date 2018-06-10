class UsersController < ApplicationController

  before_action :required_user_logged_in, only: [:index, :show]
  # TODO: 同じチームのユーザーのみ閲覧可

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find_by(name: params[:id])
    @articles = @user.articles
  end

  def new
    @team = Team.find_by(name: params[:team_id])
    @user = User.new
  end

  def create
    team = Team.find_by(name: params[:team_id])
    @user = team.users.build(user_params)

    if @user.save
      flash[:success] = 'ユーザーを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
