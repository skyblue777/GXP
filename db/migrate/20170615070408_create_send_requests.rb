class CreateSendRequests < ActiveRecord::Migration
  def change
    create_table :send_requests do |t|
      t.string :message
      t.string :phone_no
      t.timestamps null: false
    end
    add_column :users, :phone_no, :string
  end
end
