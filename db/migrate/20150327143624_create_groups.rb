class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :project, index: true
      t.string :name
      t.string :image_id
      t.string :bio

      t.timestamps null: false
    end
    add_foreign_key :groups, :projects
  end
end
