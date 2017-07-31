class Admin::OrdersController < Admin::BaseController
# require 'shippo'
# Shippo::API.token = 'shippo_test_8750275c450dd5b56894cf3eb2893cfcf1560b83'
  def show
    @order = find_order
    @payment = Payment.find_by(order_id: @order.id)
  end

  def index
    @orders = Order.where(complete: true).where(deletion_status: nil).order(created_at: :desc)
    respond_with @orders
  end

  def edit
    @order = find_order
  end

  def update
    @order = find_order
    @order.update permitted_params
    respond_with @order
  end

  def destroy
    @order = find_order
    @order.update_attributes(deletion_status: true)
    respond_with @order
  end

  def order_shiping
    shiping_detail = ShipingDetails.new
    shiping_detail_status = shiping_detail.create_shipment
    # if shiping_detail_status[:status] == "SUCCESS"
    # else
    # end
  end  

  private

    def permitted_params
      params.require(:order).permit :name, :shipped, :payment_id, :tracking_number
    end

    def find_order
      Order.find(params[:id])
    end

end
