class AddAdditionalMetaData < ActiveRecord::Migration
  def change
    add_column :images, :image_filename, :string
    add_column :images, :image_size, :integer
    add_column :images, :image_content_type, :string

    add_column :projects, :video_filename, :string
    add_column :projects, :video_size, :integer
    add_column :projects, :video_content_type, :string

    rename_column :projects, :video_cache_id, :video_id
  end
end
