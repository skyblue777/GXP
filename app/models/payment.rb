class Payment < ActiveRecord::Base
  belongs_to :order
  belongs_to :subscription
  belongs_to :user

  has_many :refunds
  
  # after_create :notify_admin

  # private

  #   def notify_admin
  #     SaleMailer.admin_notice(self).deliver_later   
  #   end
end
