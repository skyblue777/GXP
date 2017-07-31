class CreateRedemptionCodes < ActiveRecord::Migration
  def change
    create_table :redemption_codes do |t|
      t.references :user, index: true
      t.string :code

      t.timestamps null: false
    end
    add_foreign_key :redemption_codes, :users
  end
end
