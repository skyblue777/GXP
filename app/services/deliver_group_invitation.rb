class DeliverGroupInvitation

  def initialize(group)
    @group = group
    @emails = parse_emails
  end

  def call
    @emails.each do |email|
      deliver! email unless already_invited? email
    end
  end

  private

    def parse_emails
      JSON.parse @group.invited_user_emails
    rescue
      []
    end

    def already_invited?(email)
      @group.users.exists?(email: email) or @group.invitations.exists?(email: email)
    end

    def already_user?(email)
      User.exists? email: email
    end

    def deliver!(email)
      invitation = @group.invitations.create email: email
      if already_user?(email)
        GroupMailer.invite_existing_user(invitation).deliver_later
      else
        GroupMailer.invite_new_user(invitation).deliver_later
      end
    end

end
