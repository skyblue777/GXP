class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :duration
      t.date :start_date
      t.string :region
      t.text :notes
      t.text :admin_notes
      t.timestamps null: false
    end
  end
end
