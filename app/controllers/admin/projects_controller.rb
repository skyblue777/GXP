class Admin::ProjectsController < Admin::BaseController

  def index
    @projects = Project.all.where(deletion_status: nil)
    respond_with @projects
  end

  def show
    @project = find_project
  end

  def new
    @project = Project.new
    @image = @project.images.build
  end

  def create
    errors = []
    @project = Project.create permitted_params
    # @project = Project.create()
    # @user = @project
    if !@project.errors.blank?
      @project.errors.messages.each do |key, msg|
        errors << "#{key} #{msg.to_s}"
      end
      flash.now[:alert] = errors.to_s.gsub('\"]','').gsub('[\"','').gsub(']','').gsub('[','')
    end
    respond_with @project
  end

  def edit
    @project = find_project
  end

  def update
    errors = []
    @project = find_project
    @project.update permitted_params
    if !@project.errors.blank?
      @project.errors.messages.each do |key, msg|
        errors << "#{key} #{msg.to_s}"
      end
      flash.now[:alert] = errors.to_s.gsub('\"]','').gsub('[\"','').gsub(']','').gsub('[','')
    end    
    respond_with @project
  end

  def destroy
    @project = find_project
    # @project.destroy
    @project.update_attributes(deletion_status: true)
    respond_with @project
  end

  private

    def permitted_params
      params.require(:project).permit :name, :body, :audio, :video, :tagline, :contest_id, :category_ids, images_attributes: [:image, :description]
      # params.require(:project).permit :name, :body, :video, :tagline, :contest_id, :category_id, :image, :description
    end

    def find_project
      Project.find params[:id]
    end

end
