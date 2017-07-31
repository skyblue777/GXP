class RemoveCommentCount < ActiveRecord::Migration
  def change
    remove_column :projects, :comments_count, :integer, default: 0
  end
end
