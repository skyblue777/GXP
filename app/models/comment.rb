class Comment < ActiveRecord::Base
  belongs_to :user #, required: true
  belongs_to :project, required: true, touch: true
  belongs_to :commentable, polymorphic: true, required: true
  has_many :comments, as: :commentable

  validates :body, presence: true
  validates :body, length: { maximum: 1000 }
end
