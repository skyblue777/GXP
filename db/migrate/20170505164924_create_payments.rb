class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :transaction_id
      t.string :location_id
      t.integer :amount
      t.string :card_brand
      t.string :card_last_4
      t.belongs_to :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :payments, :orders
  end
end
