class Refund < ActiveRecord::Base
  belongs_to :payment
  belongs_to :order
  belongs_to :subscription
end
