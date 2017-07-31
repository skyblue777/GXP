class Sponsor < ActiveRecord::Base
  validates :name, :phone, :email, presence: true
end
