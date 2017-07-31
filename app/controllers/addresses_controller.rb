class AddressesController < ApplicationController
  def new
    redirect_to checkout_path(current_order) if current_order.shipping_address.present? && current_order.shipping_address.valid?
    @address = Address.new
  end

  def create
    @address = Address.where("mobile = ? ", params[:address][:mobile]).last
    @order_email = @address.nil? ? "" : Order.find_by(shipping_address_id: @address.id).email
    if User.find_by(email: @order_email).blank?
      redirect_to checkout_path(current_order) if current_order.shipping_address.present?
      @address = Address.new(address_params)
      if @address.save
        @address.update_attributes(mobile: "#{params[:country_code]}#{params[:address][:mobile]}")
        current_order.update shipping_address: @address
        redirect_to checkout_path(current_order)
      else
        render :new
      end      
    else
      flash[:warning] = "User mobile no. already used for signed up."
      redirect_to new_address_path
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.attributes = address_params
    if @address.save
      @address.update_attributes(mobile: params[:country_code] + address_params[:mobile]) if current_user.nil?      
      redirect_to checkout_path(current_order)
    else
      render :edit
    end
  end

  private

    def address_params
      params.require(:address).permit(:email, :street, :city, :zip, :state, :name, :country, :mobile)
    end

end
