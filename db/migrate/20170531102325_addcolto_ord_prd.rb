class AddcoltoOrdPrd < ActiveRecord::Migration
  def change
    remove_column :order_products, :product_prices_id
    add_foreign_key :order_products, :product_prices, index: true
  end
end
