class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true

  def total_price
    product.price * quantity
  end
end
