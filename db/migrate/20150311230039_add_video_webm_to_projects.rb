class AddVideoWebmToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :video_webm_id, :string
  end
end
