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
  end

  private

  def login(name, password)
    @user = User.find_by(name: name)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
