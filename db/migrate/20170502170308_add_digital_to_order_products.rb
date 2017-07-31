class AddDigitalToOrderProducts < ActiveRecord::Migration
  def change
    add_column :order_products, :digital, :boolean
  end
end
