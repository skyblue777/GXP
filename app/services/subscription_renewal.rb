class SubscriptionRenewal
  def renew_subscription_plan
    users = User.all.where(is_permanent: false)
    users.each do |user|
      user.votes.each do |vote|
        if vote.contest.ends_at.to_date <= Time.zone.now.to_date
          user.subscriptions.first.update_attributes(renewal_status: false)
        end
      end
    end
  end
end