class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:username, :email, :password, :password_confirmation)
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "You're now signed up!"
    else
      render :new
    end
  end

end
