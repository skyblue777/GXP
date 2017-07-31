class GroupInvitationsController < ApplicationController
  respond_to :json

  def accept
    invitation = GroupInvitation.find_by! code: params[:invitation_code]
    AcceptGroupInvitation.new(invitation).call
    if invitation.accepted?
      flash[:notice] = I18n.t 'flash.group_invitations.accepted'
    else
      flash[:alert] = I18n.t 'flash.group_invitations.accepted_failure'
    end
    redirect_to project_path(invitation.project)
  end

  def destroy
    @invitation = GroupInvitation.find params[:id]
    authorize @invitation
    @invitation.project.users.destroy @invitation.user if @invitation.accepted?
    if @invitation.destroy
      head 204
    else
      head 400
    end
  end

end
