class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.integer :amount
      t.boolean :active
      t.string :customer_id
      t.string :card_id
      t.string :card_brand
      t.string :card_last_4
      t.integer :card_exp_month
      t.integer :card_exp_year
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :subscriptions, :users
  end
end
