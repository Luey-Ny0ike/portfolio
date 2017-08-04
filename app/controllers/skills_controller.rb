class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def new
   @skill = Skill.new
   @skills = Skill.all
   render :new
  end

  def create
      @skill = Skill.new(skill_params)
      if @skill.save
        redirect_to  skills_path
      else
        render :new
      end
  end

  def edit
      @Skill = Skill.find(params[:id])
      render :edit
  end

  private
    def skill_params
      params.require(:skill).permit(:name, :description)
    end
end
