class CreateBookVersions < ActiveRecord::Migration
  def change
    create_table :book_versions do |t|
      t.string :version_name
      t.timestamps null: false
    end
    add_reference :products, :book_versions, index:true, foreign_key: true
  end
end
