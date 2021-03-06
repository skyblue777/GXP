class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.integer :weight, default: 1

      t.timestamps null: false
    end
    add_foreign_key :votes, :users
    add_foreign_key :votes, :projects
  end
end
