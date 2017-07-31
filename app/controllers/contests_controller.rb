class ContestsController < ApplicationController
  authenticated! only: :index

  def index
    location = GeoLocation.new(current_user, request).location
    @contests = Contest.near_US location.city
    respond_with @contests
  end

  def show
    @contest = Contest.find_by slug: params[:id]
    redirect_to contest_projects_path(@contest)
  end
end
