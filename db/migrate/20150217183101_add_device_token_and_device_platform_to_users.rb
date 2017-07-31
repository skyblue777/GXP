class AddDeviceTokenAndDevicePlatformToUsers < ActiveRecord::Migration
  def change
    add_column :users, :device_token, :string
    add_column :users, :device_platform, :string
  end
end
