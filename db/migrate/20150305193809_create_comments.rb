class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :project, index: true
      t.references :user, index: true
      t.string :body

      t.timestamps null: false
    end
    add_foreign_key :comments, :projects
    add_foreign_key :comments, :users
  end
end
