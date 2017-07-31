class AddNewColToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :deletion_status, :boolean
  end
end
