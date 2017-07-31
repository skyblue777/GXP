class AddColtoOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :users
  end
end
