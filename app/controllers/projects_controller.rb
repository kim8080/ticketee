class ProjectsController < ApplicationController
  # Creation
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
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
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
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
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project has been destroyed."
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
