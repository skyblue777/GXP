class AddColToProdPrice < ActiveRecord::Migration
  def change
    add_column :product_prices, :book_type, :string
  end
end
