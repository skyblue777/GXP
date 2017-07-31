class AddImageCacheIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_cache_id, :string
  end
end
