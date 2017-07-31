class ProjectsController < ApplicationController
  authenticated! only: [:new, :create]
  before_action :setup_crop_coordinates, only: [:new, :create, :edit, :update]

  def index
    @categories, @contests = Category.all, Contest.current
    @contest  = find_contest
    @category = find_category
    @projects = @category ? @category.projects : Project.all
    @projects = @projects.where(contest: @contest) if !@contest.blank?
    # @projects = authorized @projects
    @projects = search @projects, :name, :body
    if !params[:contest_id].nil? || !params[:query].nil? || !params[:category_id].nil?
      @projects = paginate @projects.includes(:users, :votes).order(votes_count: :desc, updated_at: :asc)
    else
      @projects = paginate Project.all.includes(:users, :votes).order(votes_count: :desc, updated_at: :asc)
    end
  end

  def show
    # @project = find_and_authorize_project
    @project = Project.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @project.child_comments
    # flash.now[:warning] = I18n.t 'project.processing_video' if @project.processing_video?
  end

  def new
    if current_user.is_permanent?
      @contest = find_contest
      @project = @contest.projects.build
      @image = @project.images.build
      # authorize @project
      render :new
    else
      flash[:alert] = "Please purchase book to create project"
      redirect_to projects_path
    end
  end

  def create
    # if current_user.projects.count < current_user.orders.count
      errors = []
      @project = Project.new permitted_params
      @project.administrators << current_user
      @project.step = 2
      @project.category_ids = params[:project][:category_ids].reject(&:blank?)
      @project.save
      if !@project.errors.blank?
        @project.errors.messages.each do |key, msg|
          errors << "#{key} #{msg.to_s}"
        end
        flash.now[:alert] = errors.to_s.gsub('\"]','').gsub('[\"','').gsub(']','').gsub('[','')
        @contest = find_contest
        @project = @contest.projects.build     
        render :new
      else
        params["project"]["image"].each do |img|
          @image = @project.images.create(image: img)
        end         
        respond_with @project, location: -> { step2_project_path(@project) }
      end
    # else
    #   @contest = find_contest
    #   @project = @contest.projects.build
    #   flash.now[:alert] = "Please purchase a book to submit a project."
    #   render :new
    # end
  end

  def delete_images
    @project = Project.find_by(id: params[:project_id])
    @image = Image.where("id = ? AND project_id = ?", params[:img_id], params[:project_id]).destroy_all
    flash[:alert] = " Image deleted successfully."    
    redirect_to edit_project_path(@project)
  end

  def step2
    @project = find_and_authorize_project
    @group = @project.group || Group.new
    @user = @project.users.first
  end

  def finalize
    @project = find_and_authorize_project
    @project.update finalized: true
    respond_with @project, location: project_path(@project)
  end

  def edit
    @project = find_and_authorize_project
  end

  def update
    errors = []
    @project = find_and_authorize_project
    @project.attributes = permitted_params
    @project.category_ids =  params[:project][:category_ids].reject(&:blank?)
    @project.save
    if !@project.errors.blank?
      @project.errors.messages.each do |key, msg|
        errors << "#{key} #{msg.to_s}"
      end
      flash.now[:alert] = errors.to_s.gsub('\"]','').gsub('[\"','').gsub(']','').gsub('[','')
    end
    if !params["project"]["image"].nil?
      params["project"]["image"].each do |img|
        @image = @project.images.create(image: img)
      end
    end   
    respond_with @project, location: step2_project_path(@project)
  end

  private

    def find_and_authorize_project
      project = Project.find params[:id]
      # authorize project
      project
    end

    def find_category
      Category.find_by id: params[:category_id]
    end

    def find_contest
      if params[:contest_id]
        Contest.find_by slug: params[:contest_id]
      else
        Contest.main
      end
    end

    def setup_crop_coordinates
      @crop_coordinates = CropCoordinates.new *crop_params
    end

    def queue_image_cropper(&block)
      if yield
        CropImageWorker.perform_later @project, *@crop_coordinates.to_a
      end
    end

    def permitted_params
      params.require(:project).permit :name, :body, :video, :audio, :tagline, :contest_id, images_attributes: [:image, :description]
      # params.require(:project).permit :name, :body, :video, :tagline, :contest_id, :image, :description
    end

    def per_page
      12
    end

    def crop_params
      [
        params[:image_crop_x],
        params[:image_crop_y],
        params[:image_crop_w],
        params[:image_crop_h]
      ]
    end

end
