class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.integer :quantity

      t.timestamps null: false
    end
    add_foreign_key :order_products, :orders
    add_foreign_key :order_products, :products
  end
end
