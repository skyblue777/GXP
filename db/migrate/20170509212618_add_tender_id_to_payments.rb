class AddTenderIdToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :tender_id, :string
  end
end
