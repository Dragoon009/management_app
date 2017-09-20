class AssignedProjectsController < ApplicationController
	before_action :admin_user,     only: [:new, :create, :index, :destroy]
	before_action :current_project, only: [:new, :create]

	def index
    @assigned_projects = AssignedProject.all
  end

  def new
  	@assigned_project = AssignedProject.new
 	end

	def edit
	  @assigned_project = AssignedProject.find(params[:id])
		@current_project = @assigned_project.project
	end

	def update
	  @assigned_project = AssignedProject.find(params[:id])
		@current_project = @assigned_project.project
	  if @assigned_project.update_attributes(assigned_project_params)
	  	redirect_to @assigned_project
	  else
	   	render 'edit'
	  end
	end

 	def create
 		@assigned_project = AssignedProject.new(assigned_project_params)
    if @assigned_project.save
    	redirect_to @assigned_project
    else
    	render 'new'
    end
  end

  def show
  	@assigned_project = AssignedProject.find(params[:id])
  end

  def destroy
    AssignedProject.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to assigned_projects_path
  end

  private
	def assigned_project_params
	  params.require(:assigned_project).permit(:user_id,:project_id)
	end

	def current_project
		@current_project = Project.find(params[:project_id])
	end
end
