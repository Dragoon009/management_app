class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  protected
	def authenticate_user
  	if session[:user_id]
    	@current_user = User.find session[:user_id]
    	return true
  	else
   	 redirect_to(:controller => 'sessions', :action => 'new')
   	 return false
  	end
	end
	def save_login_state
  	if session[:user_id]
   	 redirect_to(:controller => 'sessions', :action => 'show')
     return false
  	else
     return true
  	end
	end

  def admin_user
    unless current_user.admin?
      flash[:danger] = "You are not authorized for this action"
      redirect_to(root_url)
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(new_session_path) unless @user == current_user
  end
end
