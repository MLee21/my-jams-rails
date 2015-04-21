class SessionsController < ApplicationController


  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user 
    else
      flash[:error] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
    flash[:notice] = "Successfully logged out"
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end