class AddVideoToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :video_id, :string
  end
end
