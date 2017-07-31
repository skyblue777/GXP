class AddColToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :phone_verified, :boolean
    remove_column :users, :phone_verified, :boolean
  end
end
