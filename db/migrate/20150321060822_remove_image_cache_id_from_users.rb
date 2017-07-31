class RemoveImageCacheIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :image_cache_id, :string
  end
end
