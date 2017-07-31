class AddFinalizedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :finalized, :boolean, default: false, null: false
  end
end
