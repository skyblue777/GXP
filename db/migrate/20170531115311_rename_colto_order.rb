class RenameColtoOrder < ActiveRecord::Migration
  def change
    rename_column :orders, :users_id, :user_id
  end
end
