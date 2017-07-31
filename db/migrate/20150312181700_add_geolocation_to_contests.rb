class AddGeolocationToContests < ActiveRecord::Migration
  def change
    add_column :contests, :location, :string
    add_column :contests, :longitude, :float
    add_column :contests, :latitude, :float
  end
end
