module GroupInvitationsHelper

  def invitation_status(invitation)
    if invitation.accepted?
      'accepted'
    else
      'pending'
    end
  end

end
