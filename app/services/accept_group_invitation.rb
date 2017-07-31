class AcceptGroupInvitation

  def initialize(invitation)
    @invitation = invitation
  end

  def call
    user = User.find_by email: @invitation.email
    if user
      @invitation.update accepted: true
      @invitation.project.users << user
    end
  end

end
