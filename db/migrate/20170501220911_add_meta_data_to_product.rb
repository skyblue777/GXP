class AddMetaDataToProduct < ActiveRecord::Migration
  def change
    add_column :products, :book_download_filename, :string
    add_column :products, :book_download_content_type, :string
  end
end
