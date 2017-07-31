class AddSubscriptionToUser < ActiveRecord::Migration
  def change
    add_column :users, :payola_subscription_id, :integer
  end
end
