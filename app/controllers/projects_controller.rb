class ProjectsController < ApplicationController
  before_action :set_project, only: [
                                :show,
                                :edit,
                                :update,
                                :destroy
                            ]
  # Creation
  def index
    @projects = Project.all
  end

  def show
    
  end

  # Reading
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash[:alert] = "Project has not been created."
      render "new"
    end
  end

  # Updating
  def edit

  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else
      flash[:alert] = "Project has not been updated."
      render "edit"
    end
  end

  # Deleting
  def destroy
    @project.destroy
    flash[:notice] = "Project has been destroyed."
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end

    def set_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for cound not be found."
      redirect_to projects_path
    end
end
