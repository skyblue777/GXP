class RedemptionCodeBelongsToOrder < ActiveRecord::Migration
  def up
    remove_index :redemption_codes, :user_id
    remove_column :redemption_codes, :user_id, :integer
    add_column :redemption_codes, :order_id, :integer, index: true
  end

  def down
    remove_index :redemption_codes, :order_id
    remove_column :redemption_codes, :order_id, :integer
    add_column :redemption_codes, :user_id, :integer, index: true
  end
end
