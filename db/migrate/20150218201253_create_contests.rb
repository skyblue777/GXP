class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps null: false
    end
  end
end
