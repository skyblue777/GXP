class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :shipped
      t.integer :price
      t.boolean :complete
      t.integer :tax
      t.integer :subtotal
      t.integer :shipping
      t.string :name
      t.string :permalink
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
