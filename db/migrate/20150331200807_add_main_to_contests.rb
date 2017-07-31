class AddMainToContests < ActiveRecord::Migration
  def change
    add_column :contests, :main, :boolean, null: false, default: false
  end
end
