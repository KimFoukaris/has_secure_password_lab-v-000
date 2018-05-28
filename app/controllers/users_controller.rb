class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.password == @user.password_confirmation
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find_by(name: sessions[:name])
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
