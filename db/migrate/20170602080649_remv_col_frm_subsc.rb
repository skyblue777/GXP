class RemvColFrmSubsc < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :start_date, :datetime
    remove_column :subscriptions, :end_date, :datetime
    add_column :subscriptions, :sub_mobile_no, :string
  end
end
