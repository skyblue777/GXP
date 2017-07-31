class Group < ActiveRecord::Base
  belongs_to :project
  has_many :users, through: :project
  has_many :invitations, class_name: 'GroupInvitation'

  attr_accessor :invited_user_email, :invited_user_emails
  attachment :image, extension: %w(jpg jpeg png gif)

  validates :project, presence: true
  validates :name, presence: true
  validates :bio, presence: true, length: { maximum: 250 }

end
