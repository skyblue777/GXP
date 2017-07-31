class RenameColProductsPrice < ActiveRecord::Migration
  def change
    rename_column :product_prices, :products_id, :product_id
  end
end
