class SessionsController < ApplicationController
  def new

  end

  def create
    name     = params[:session][:name]
    password = params[:session][:password]
    if login(name, password)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def login(name, password)
    @user = User.find_by(name: name)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end

  def getLevel(id)
    level = User.find(id).user_level
    return level
  end
end
