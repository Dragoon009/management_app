class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  def new
  	@user = User.new
    @skills = Skill.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
    	redirect_to @user
    else
      flash[:error] =  @user.errors.full_messages.join(', ')
      redirect_to :action => 'new'
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    @skills = Skill.all
  end

  def update
    @skills = Skill.all
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:role, :name,:email,:image, :password, :password_confirmation, :skill_ids => [])
  end

  def admin_user
      flash[:danger] = "You are not authorized for this action"
      redirect_to(root_url)
    unless
       current_user.admin?
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      #redirect_to login_url
    end
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end