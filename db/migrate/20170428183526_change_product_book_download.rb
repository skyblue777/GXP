class ChangeProductBookDownload < ActiveRecord::Migration
  def change
    rename_column :products, :book_download, :book_download_id
  end
end
