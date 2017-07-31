class AddNameToContests < ActiveRecord::Migration
  def change
    add_column :contests, :name, :string
    add_column :contests, :terms_of_service, :text
  end
end
