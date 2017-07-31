class AddColToOrderProducts < ActiveRecord::Migration
  def change
    add_reference :order_products, :product_price, index: true, foreign_key: true
  end
end
