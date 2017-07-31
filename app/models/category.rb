class Category < ActiveRecord::Base
  has_many :project_categories, dependent: :destroy
  has_many :projects, through: :project_categories
  validates :name, presence: true, uniqueness: true
end
