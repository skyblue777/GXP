class AddFieldsToRefunds < ActiveRecord::Migration
  def change
    add_reference :refunds, :order, index: true
    add_foreign_key :refunds, :orders
    add_reference :refunds, :subscription, index: true
    add_foreign_key :refunds, :subscriptions
  end
end
