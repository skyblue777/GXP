class MakeCompleteColumnDefaultFalse < ActiveRecord::Migration
  def up
    change_column :orders, :complete, :boolean, default: false
  end

  def down
    change_column :orders, :complete, :boolean, default: nil
  end
end
