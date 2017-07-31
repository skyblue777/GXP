class EmailsController < ApplicationController

  def new
    @order = current_order
    if !current_user.nil?
      if @order.email.present?
        if @order.order_products.where(digital: false).count > 0
          redirect_to new_address_path
        else
          redirect_to checkout_path(@order)
        end
      end
    end
  end

  def create
    if User.find_by(email: params[:email]).nil?
      @order = current_order
      # redirect_to new_address_path and return if @order.email.present? && @order.valid?
      if @order.update_attribute(:email, params[:email])
        if @order.order_products.where(digital: false).count > 0
          redirect_to new_address_path and return
        else
          redirect_to checkout_path(@order)
        end
      else
        redirect_to :back, alert: "Please re-enter your email"
      end
    else
      redirect_to :back, alert: "User email already exists"
    end
  end
end
