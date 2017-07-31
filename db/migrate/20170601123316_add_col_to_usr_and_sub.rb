class AddColToUsrAndSub < ActiveRecord::Migration
  def change
    add_column :users, :is_permanent, :boolean
    add_column :subscriptions, :email, :string
    add_column :subscriptions, :start_date, :datetime
    add_column :subscriptions, :end_date, :datetime
    add_column :subscriptions, :subscription_otp, :integer
    remove_column :orders, :phone_verified, :boolean
  end
end
