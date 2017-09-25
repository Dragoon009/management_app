class ProjectUsersController < ApplicationController
  before_action :admin_user,     only: [:new, :create,:edit, :index, :destroy, :show]
	before_action :current_project, only: [:new, :create]

	def index
    @assign_users = ProjectUser.all
  end

  def new
  	@assign_user = ProjectUser.new
 	end

 	def create
 		@assign_user = ProjectUser.new(assign_user_params)
    if @assign_user.save
      redirect_to @assign_user
    else
    	render 'new'
    end
  end

  def show
  	@assign_user = ProjectUser.find(params[:id])
  end

	def edit
	  @assign_user = ProjectUser.find(params[:id])
		@current_project = @assign_user.project
	end

	def update
	  @assign_user = ProjectUser.find(params[:id])
		@current_project = @assign_user.project
	  if @assign_user.update_attributes(assign_user_params)
	  	redirect_to @assign_user
	  else
	   	render 'edit'
	  end
	end

  def destroy
    ProjectUser.find(params[:id]).destroy
    flash[:success] = "Project unassigned"
    redirect_to assign_users_url
  end

  private
	def assign_user_params
	  params.require(:project_user).permit(:user_id,:project_id)
	end

	def current_project
		@current_project = Project.find(params[:project_id])
	end
end
