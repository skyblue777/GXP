class CreateAdminMobEmails < ActiveRecord::Migration
  def change
    create_table :admin_mob_emails do |t|
      t.string :admin_email
      t.string :admin_mobile_no
      t.timestamps null: false
    end
  end
end
