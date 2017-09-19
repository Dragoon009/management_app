class AssignedProjectsController < ApplicationController

	def index
    @assignedprojects = AssignedProject.all
  end

  def new
  	@assignedproject = AssignedProject.new
    @current_project = Project.find(params[:project_id])
 	end

 	def create
 		@assignedproject = AssignedProject.new(params[:assignedproject])
    if @assignedproject.save
    	redirect_to @assignedproject
    else
    	render 'new'
    end
  end

  def edit
    @assignedproject = AssignedProject.find(params[:id])
  end

  def update
    @assignedproject = AssignedProject.find(params[:id])
    if @assignedproject.update_attributes(params[:assignedproject])
    	redirect_to @assignedproject
    else
    	render 'edit'
    end
  end

  def show
  	@assignedproject = AssignedProject.find(params[:id])
  end

  def destroy
    AssignedProject.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to assignedprojects_url
  end


  private
  def assignedproject_params
    params.require(:assignedproject).permit(:user_id,:project_id)
  end

end
