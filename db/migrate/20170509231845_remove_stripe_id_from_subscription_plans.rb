class RemoveStripeIdFromSubscriptionPlans < ActiveRecord::Migration
  def change
    remove_column :subscription_plans, :stripe_id, :string
  end
end
