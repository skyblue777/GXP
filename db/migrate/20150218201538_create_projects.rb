class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :body, limit: 64.kilobytes + 1
      t.references :user, index: true
      t.references :contest, index: true
      t.integer :votes_count, default: 0
      t.integer :comments_count, default: 0

      t.timestamps null: false
    end
    add_foreign_key :projects, :users
    add_foreign_key :projects, :contests
  end
end
