class CreateProductPrices < ActiveRecord::Migration
  def change
    create_table :product_prices do |t|
      t.references :products, index: true, foreign_key: true
      t.decimal :price
      t.string  :book_version
      t.timestamps null: false
    end
  end
end
