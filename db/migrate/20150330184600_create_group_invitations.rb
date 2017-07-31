class CreateGroupInvitations < ActiveRecord::Migration
  def change
    create_table :group_invitations do |t|
      t.references :group, index: true
      t.string :email
      t.boolean :accepted, null: false, default: false
      t.string :code, unique: true

      t.timestamps null: false
    end
    add_foreign_key :group_invitations, :groups
  end
end
