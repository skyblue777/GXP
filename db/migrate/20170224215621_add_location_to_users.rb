class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
  end
end
