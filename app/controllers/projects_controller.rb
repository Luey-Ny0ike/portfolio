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
