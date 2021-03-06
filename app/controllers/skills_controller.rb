class SkillsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :show]
  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
    render :show
  end

  def new
    @skill = Skill.new
    @skills = Skill.all
    render :new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to skills_path
    else
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
    render :edit
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to skills_path
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to skills_path
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
