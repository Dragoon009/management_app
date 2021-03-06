class SkillsController < ApplicationController
  before_action :admin_user,     only: [:new, :create,:edit,:update, :index, :destroy, :show]
  def new
  	@skill = Skill.new
  end

  def edit
    @skill = Skill.find(params[:id])

  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to new_skill_path
    else
      flash[:error] =  @skill.errors.full_messages.join(', ')
      redirect_to new_skill_path
    end
  end

  def index
    @skills = Skill.all
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to @skill
    else
      render 'edit'
    end
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def destroy
   Skill.find(params[:id]).destroy
   flash[:success] = "Skill deleted"
   redirect_to skills_url
  end

  private
    def skill_params
      params.require(:skill).permit(:skill,:user_ids => [])
    end
end
