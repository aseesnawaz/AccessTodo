class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to lists_url
    else
      flash[:errors] = @user
      redirect_to new_session_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
