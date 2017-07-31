class AddImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image_id, :string
    add_column :products, :image_filename, :string
    add_column :products, :image_size, :integer
    add_column :products, :image_content_type, :string
  end
end
