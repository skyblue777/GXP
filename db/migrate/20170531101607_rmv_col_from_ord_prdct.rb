class RmvColFromOrdPrdct < ActiveRecord::Migration
  def change
    add_reference :order_products, :product_prices, index: true, foreign_key: true
    remove_column :order_products, :product_id
  end
end
