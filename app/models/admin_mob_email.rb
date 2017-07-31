class AdminMobEmail < ActiveRecord::Base
  validates :admin_email, :presence => true, :uniqueness => true
  validates :admin_mobile_no, :presence => true
  validates :code, :presence => true
  validates :admin_email, email_format: { message: "doesn't look like an email address" }
  validates_length_of :admin_mobile_no, :maximum => 15
end
