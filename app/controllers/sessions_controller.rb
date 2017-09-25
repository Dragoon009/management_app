class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.authenticate(params[:email],params[:login_password])
  	if @user
    	log_in @user
  	  redirect_to @user
  	else
   	  flash[:notice] = "Invalid Username or Password"
    	flash[:color]= "invalid"
   	  redirect_to new_session_path
  	end
  end

  def destroy
    log_out
    redirect_to new_session_path
  end
end
