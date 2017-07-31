class AddStepToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :step, :integer, default: 1
  end
end
