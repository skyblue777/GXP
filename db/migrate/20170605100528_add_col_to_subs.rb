class AddColToSubs < ActiveRecord::Migration
  def change
    add_column :subscriptions, :card_cvv, :integer
  end
end
