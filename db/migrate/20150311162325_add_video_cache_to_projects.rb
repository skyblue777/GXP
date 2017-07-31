class AddVideoCacheToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :video_cache_id, :string
  end
end
