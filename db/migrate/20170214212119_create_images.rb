class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :project, index: true
      t.string :image_id
      t.text :description
      t.timestamps null: false
    end

    remove_column :projects, :image_id
  end
end
