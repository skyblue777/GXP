class RemovePayolaSubscriptionIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :payola_subscription_id, :string
  end
end
