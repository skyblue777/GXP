class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.timestamps null: false
    end

    add_column :orders, :shipping_address_id, :integer
    add_column :orders, :billing_address_id, :integer
    remove_column :orders, :user_id, :integer
  end
end
