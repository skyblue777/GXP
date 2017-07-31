class GroupMailer < ApplicationMailer

  def invite_existing_user(invitation)
    @accept_url = accept_group_invitations_url(invitation_code: invitation.code)
    invite_user invitation
  end

  def invite_new_user(invitation)
    @sign_up_url = new_user_registration_url(invitation_code: invitation.code)
    invite_user invitation
  end

  private

    def invite_user(invitation)
      @invitation = invitation
      @group = invitation.group
      @project = invitation.project
      @purchase_url = products_url
      mail to: invitation.email, subject: "You have been invited to join the #{@project} project on Green X!"
    end

end
