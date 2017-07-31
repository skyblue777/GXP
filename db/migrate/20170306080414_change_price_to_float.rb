class ChangePriceToFloat < ActiveRecord::Migration
  reversible do |dir|
    dir.up do
      change_column :products, :price, :decimal
      change_column :orders, :price, :decimal
      change_column :orders, :subtotal, :decimal
      change_column :orders, :shipping, :decimal
      change_column :orders, :tax, :decimal
    end
    dir.down do
      change_column :products, :price, :integer
      change_column :orders, :price, :integer
      change_column :orders, :subtotal, :integer
      change_column :orders, :shipping, :integer
      change_column :orders, :tax, :integer
    end
  end
end
