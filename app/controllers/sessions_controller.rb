class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.authenticate(params[:email],params[:login_password])
  	if @user
    	log_in @user
  	  redirect_to @user
  	else
   	  flash.now[:notice] = "Invalid Username or Password"
    	flash.now[:color]= "invalid"
   	  render "new"	
  	end
  end	

  def destroy
    log_out
    render 'new'
  end

end

