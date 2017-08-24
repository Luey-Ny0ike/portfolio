class ProjectsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :show]
  def new
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new(project_params)
    if @project.save
      redirect_to skill_path(@project.skill)
    else
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    if @skill.projects.update(project_params)
      redirect_to skill_path(@project.skill)
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to skill_path(@project.skill)
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :link, :image)
  end
end
