class AddFieldsToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :subscription, index: true
    add_foreign_key :payments, :subscriptions
    add_column :payments, :card_exp_month, :integer
    add_column :payments, :card_exp_year, :integer
    add_reference :payments, :user, index: true
    add_foreign_key :payments, :users
  end
end
