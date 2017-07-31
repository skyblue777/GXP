class AddVideoMp4ToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :video_mp4_id, :string
  end
end
