class AddMobileNumberToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :mobile, :character
  end
end
