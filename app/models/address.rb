class Address < ActiveRecord::Base
  has_one :order_shipping, foreign_key: 'shipping_address_id', class_name: 'Order'
  has_one :order_billing, foreign_key: 'billing_address_id', class_name: 'Order'
  validates :street, :city, :state, :zip, :name, presence: true

  def address
    [street, city, state, zip].join(',')
  end
end
