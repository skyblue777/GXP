class Addcoltoproj < ActiveRecord::Migration
  def change
    add_column :projects, :deletion_status, :boolean
  end
end
