class CreateRefunds < ActiveRecord::Migration
  def change
    create_table :refunds do |t|
      t.string :refund_id
      t.string :transaction_id
      t.string :location_id
      t.string :tender_id
      t.integer :amount
      t.belongs_to :payment, index: true

      t.timestamps null: false
    end
    add_foreign_key :refunds, :payments
  end
end
