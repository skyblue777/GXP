class AddFieldsToOrderProducts < ActiveRecord::Migration
  def change
    add_column :order_products, :name, :string
    add_column :order_products, :price, :decimal
    add_column :order_products, :description, :text
  end
end
