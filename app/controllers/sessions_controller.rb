class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find params[:username]
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_path, notice: "Signed In!"
    else
      flash[:alert] = "Wrong credentials"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
