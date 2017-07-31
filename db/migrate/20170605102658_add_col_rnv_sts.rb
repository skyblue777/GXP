class AddColRnvSts < ActiveRecord::Migration
  def change
    add_column :subscriptions, :renewal_status, :boolean
  end
end
