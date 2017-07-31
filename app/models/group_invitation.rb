class GroupInvitation < ActiveRecord::Base
  belongs_to :group, required: true
  has_one :project, through: :group

  validates :email, presence: true, uniqueness: { scope: :group }
  validates :code, presence: true

  before_validation :ensure_code!

  def to_s
    if user
      "#{user} (#{email})"
    else
      email
    end
  end

  def user
    User.find_by email: email
  end

  private

    def ensure_code!
      self.code = loop do
        _code = SecureRandom.hex(10)
        break _code unless self.class.exists?(code: _code)
      end
    end

end
