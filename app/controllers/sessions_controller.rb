class SessionsController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
  end

  def create
    name = params[:session][:name]
    password = params[:session][:password]

    if login(name, password)
      flash[:success] = 'ログインしました'
      redirect_to @user
    else
      flash.now[:danger] = 'ログインできませんでした'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end

  private

  def login(name, password)
    @user = User.find_by(name: name)
    # TODO: @userがteamに所属しているか確認
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
