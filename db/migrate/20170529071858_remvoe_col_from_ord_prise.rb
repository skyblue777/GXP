class RemvoeColFromOrdPrise < ActiveRecord::Migration
  def change
    remove_column :product_prices, :book_version
    drop_table :book_versions
  end
end
