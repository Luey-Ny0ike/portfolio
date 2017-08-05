    def new
      @skill = Skill.find(params[:skill_id])
      @project = @skill.projects.new
    end
