class AddColToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_otp, :integer
  end
end
