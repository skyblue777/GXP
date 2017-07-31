class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscription_plan
  has_many :payments
  has_many :refunds

  def self.subscrition_renew
    obj = SubscriptionRenewal.new
    obj.renew_subscription_plan
  end
end
