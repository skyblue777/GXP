class AddColToAdminPolicy < ActiveRecord::Migration
  def change
    add_column :admin_mob_emails, :country_code, :string
  end
end
