class RmvColFromOrdProd < ActiveRecord::Migration
  def change
    remove_foreign_key :order_products, column: :product_id
  end
end
