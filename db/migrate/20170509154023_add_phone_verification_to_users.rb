class AddPhoneVerificationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_verified, :boolean
  end
end
