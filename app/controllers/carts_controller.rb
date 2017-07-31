class CartsController < ApplicationController
  def show
    # current_order.order_products
    # Order.last.order_products
    @order_products = current_order.order_products
    @shipping_count = @order_products.where(digital: false).count
  end
end
