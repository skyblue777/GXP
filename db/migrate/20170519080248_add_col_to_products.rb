class AddColToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :book_types, index:true, foreign_key: true
  end
end
