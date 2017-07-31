class AddImageIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :image_id, :string
  end
end
