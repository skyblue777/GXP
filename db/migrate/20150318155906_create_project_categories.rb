class CreateProjectCategories < ActiveRecord::Migration
  def change
    create_table :project_categories do |t|
      t.references :project, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :project_categories, :projects
    add_foreign_key :project_categories, :categories
  end
end
