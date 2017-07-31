class RedemptionCode < ActiveRecord::Base
  belongs_to :order
  before_create :generate_code

  def generate_code
    self.code = SecureRandom.urlsafe_base64
    generate_code if RedemptionCode.exists?(code: self.code)
  end
end
