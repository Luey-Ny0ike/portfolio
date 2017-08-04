class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def new
   @skill = Skill.new
   @skills = Skill.all
   render :new
  end

