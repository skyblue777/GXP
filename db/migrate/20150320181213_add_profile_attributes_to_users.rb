class AddProfileAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_id, :string
    add_column :users, :website, :string
    add_column :users, :bio, :string
  end
end
