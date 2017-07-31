class RemoveVideoFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :video_id, :string
  end
end
