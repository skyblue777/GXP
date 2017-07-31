class GroupsController < ApplicationController

  def new
  end

  def create
    @group = Group.new permitted_params
    @project = find_and_authorize_project
    @group.project = @project
    if @group.save
      send_invites @group
    end
    respond_with @group
  end

  def edit
    @group = find_and_authorize_group
    @project = @group.project
    render :new
  end

  def update
    @group = find_and_authorize_group
    if @group.update permitted_params
      send_invites @group
    end
    respond_with @group
  end

  private

    def permitted_params
      params.require(:group).permit :name, :image, :bio, :invited_user_emails
    end

    def find_and_authorize_project
      Project.find(params[:project_id]).tap do |project|
        authorize project, :update?
      end
    end

    def find_and_authorize_group
      Group.find(params[:id]).tap do |group|
        authorize group
      end
    end

    def send_invites(group)
      DeliverGroupInvitation.new(group).call
    end

end
