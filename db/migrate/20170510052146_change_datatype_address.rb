class ChangeDatatypeAddress < ActiveRecord::Migration
  def change
    change_column :addresses, :mobile, :string
  end
end
