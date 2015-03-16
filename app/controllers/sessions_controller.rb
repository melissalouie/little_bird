class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/pages/index'
    else
      flash[:alert] = "User not found"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_path
  end
end
