class AddBookDownload < ActiveRecord::Migration
  def change
    add_column :products, :book_download, :string
  end
end
