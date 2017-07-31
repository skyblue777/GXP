class Admin::ContestsController < Admin::BaseController

  def index
    @contests = Contest.all
    respond_with @contests
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.create permitted_params
    respond_with @contest
  end

  def edit
    @contest = find_contest
  end

  def update
    @contest = find_contest
    @contest.update permitted_params
    respond_with @contest
  end

  def destroy
    @contest = find_contest
    @contest.destroy
    respond_with @contest
  end

  private

    def permitted_params
      params.require(:contest).permit :name, :starts_at, :ends_at, :slug, :main, :location, :terms_of_service
    end

    def find_contest
      Contest.find_by! slug: params[:id]
    end

end
