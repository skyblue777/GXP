class ProjectUser < ActiveRecord::Base
  belongs_to :project, required: true
  belongs_to :user, required: true
  has_one :contest, through: :project

  validates :user, uniqueness: { scope: :project }

  def self.admin
    where admin: true
  end

end
