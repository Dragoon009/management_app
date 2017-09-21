class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  def new
    debugger
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
      debugger
      redirect_to new_user_path
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
    @array = @user.project_users.map(&:project_id)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:role, :name,:email,image: [:image_file_name, :image_file_size, :image_content_type, :image_updated_at], :password, :password_confirmation, :skill_ids => [])
  end

end
