class OrdersController < ApplicationController
  include ApplicationHelper
  @@msg = ""
  def checkout
    @order = current_order
    @shipping_count = @order.order_products.where(digital: false).count
    redirect_to cart_path if @order.new_record?
  end

  def paypal_response
    app_payment = PaypalPayment.new
    payment_response = app_payment.execute_payment(params[:PayerID], params[:paymentId])
    if payment_response.state == "approved"
      @order = current_order
      @user = current_user
      phone_no = Address.where(:id => @order.shipping_address_id).pluck(:mobile)
      payment = Payment.create(
        tender_id: params[:token],
        transaction_id: params[:paymentId],
        location_id:params[:PayerID],
        amount: (params[:amount]+"."+params[:format]).to_f.round(2),
        card_brand: "",
        card_last_4: "",
        order: @order,
        user: @user
      )
      @order.product_count.times do |i|
        @order.redemption_codes << (RedemptionCode.create order: @order)
      end
      random_token = SecureRandom.urlsafe_base64(nil, false)
      if @user.nil?
        @@msg = send_otp(phone_no, @order)
        if @@msg != true
          flash[:alert] = "Wrong mobile no. can't send OTP on the #{phone_no}, Please check mobile no."
          redirect_to checkout_path(current_order) and return
        end      
        @order.update_attributes(complete: true, token: random_token, user_id: 0)
        SaleMailer.receipt(@order, @@msg).deliver_later
        SaleMailer.receipt_by_admin(@order).deliver_later
        redirect_to complete_order_path(@order.name) and return
      else
        @user.update_attributes(is_permanent: true)
        @order.update_attributes(complete: true, token: random_token, email: @user.email, user_id: @user.id)
        SaleMailer.receipt(@order, @@msg).deliver_later
        SaleMailer.receipt_by_admin(@order).deliver_later
        redirect_to complete_order_path(@order.name)  and return
      end
      redirect_to complete_order_path(@order.name)  and return
    else
      flash[:alert] = payment_response
      redirect_to checkout_path(current_order) and return
    end
  end

  def process_card
    @order = current_order
    @user = current_user
    paypal_payment = PaypalPayment.new(order: @order, params: params)
    if params[:with_paypal] == "true"
      payment = paypal_payment.order_pay_with_paypal(@order, params[:amount], "#{request.base_url+checkout_path(current_order)}", "#{request.base_url+paypal_response_path(params[:amount])}", "This is Book purchase order.")
      if payment.create
        @redirect_url = payment.links.find{|v| v.rel == "approval_url" }.href
        redirect_to @redirect_url
      else
        flash[:alert] = payment.error.inspect
        redirect_to checkout_path(current_order) and return
      end
    end
  end

  def resend_otp
    @subscription = Subscription.where("sub_mobile_no = ?", params[:mobile_no]).last
    if !@subscription.blank?
      sub_msg = send_sub_otp(@subscription.sub_mobile_no)
      if sub_msg == true
        @subscription.update_attributes(subscription_otp: @pin)
        render json: {messages: "OTP has been sent on your mobile no."}
      else
        render json: {messages: sub_msg}
      end
    else
      @address = Address.where("mobile = ? ", params[:mobile_no]).last
      @order_email = @address.nil? ? "" : Order.find_by(shipping_address_id: @address.id).email
      if User.find_by(email: @order_email).blank? && !@address.blank?
        @order = Order.find_by(shipping_address_id: @address.id)
        @@msg = send_otp(params[:mobile_no], @order)
        render json: {messages: "Otp has been sent on your mobile no."}
      else
        render json: { messages: "Mobile Number not register, Please do purchase subscription plan or Book to get OTP"}
        # messages: "Please create order or User mobile no. already used for signed up."
      end
    end
  end


  def send_otp(phone_no, order)
    @pin = rand(0000..9999).to_s.rjust(4, "0")
    begin
      client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      response = client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to:   phone_no,
      body: "\nYour OTP for www.greenxprize.com is \n #{@pin}")
      order.update_attributes(order_otp: @pin)
      return true
    rescue Twilio::REST::RequestError => e
      return e.message
    end
  end

  def complete
    @order = Order.find_by_name(params[:id])
    # in order to view orders via email for downlaods
    if params[:token]
      if @order && @order.token == params[:token]
        session[:order_id] = @order.id
      end
    end
    if session[:order_id] && session[:order_id] == @order.id
      session[:order_id] = nil
      if current_user.nil? && @@msg == true
        flash[:success] = "Your order is complete. OTP has been sent on your mobile no."
      elsif @@msg != true && current_user.nil?
        flash[:warning] = "#{@@msg}"
        redirect_to root_path
      else
        flash[:success] = "Your order is complete."
      end
    else
      flash[:warning] = "Your need a valid authentication token to view your order. Check your email for the correct link."
      redirect_to root_path
    end
  end

  # original method added by metova
  # def mail_sending
  #   @order = current_order || Order.last
  #   session[:order_id] = nil
  #   flash[:success] = "Your order is complete. Email on the way!"
  #   redirect_to root_path
  # end

  private
  def send_sub_otp(phone_no)
    begin
      @pin = rand(0000..9999).to_s.rjust(4, "0")
      client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      response = client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to:   phone_no,
      body: "\nyour otp for www.greenxprize.com is \n #{@pin}")
      return true
    rescue Twilio::REST::RequestError => e
      return e.message
    end
  end



end
