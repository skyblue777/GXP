class RemnameColToAdminPolicy < ActiveRecord::Migration
  def change
    rename_column :admin_mob_emails, :country_code, :code
  end
end
