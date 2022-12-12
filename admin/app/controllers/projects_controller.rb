class ProjectsController < ApplicationController
  include Authentication
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :auth

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    # for each project, find all the skills by project.skill_ids
    @projects.each do |project|
      project.update_attribute :skills, []
      project.skill_ids.each do |skill_id|
        project.skills.push(Skill.find(skill_id))
      end
    end
  end

  # GET /projects/1 or /projects/1.json
  def show
    puts 'hi'
    helpers.get_github
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find_by!(slug: params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :description, :github_name, :slug)
    end

  def auth
    redirect = helpers.authenticate_redirect
    if redirect != nil 
      redirect_to redirect
    end
  end

end
