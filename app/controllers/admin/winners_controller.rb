class Admin::WinnersController < ApplicationController

  def index
    @contest = Contest.find_by slug: params[:contest_id]
    @projects = @contest.projects.order(votes_count: :desc, updated_at: :asc).limit 20
  end

end
