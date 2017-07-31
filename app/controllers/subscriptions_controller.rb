  class SubscriptionsController < ApplicationController
  # authenticated!
  include ApplicationHelper
  def new
    @plan = SubscriptionPlan.first
  end

  def cancel
    # If multiple subscriptions can be maintained int he future, change this
    @subscription = current_user.subscriptions.find_by(active: true, renewal_status: true)
    @subscription.update_attributes(active: false, renewal_status: false)
    redirect_to :back, notice: "You have canceled your subscription."
  end

  def process_card
    customer_charge = ""
    customer_response = ""
    payment = ""
    @plan = SubscriptionPlan.find(params["plan"])
    if params[:with_paypal] == "true"
      @mobile_no = params[:sub_country_code_pa]+params[:sub_mobile_no_pa]
      if existing_user(params[:email_pa])|| existing_sub_user(params[:email_pa])
        redirect_to :back, alert: "Email Already exists" and return
      end
      if existing_sub_mob(@mobile_no)
        redirect_to :back, alert: "Mobile no. already exists" and return
      end
      paypal_payment = PaypalPayment.new(order: @order, params: params)
      subscription_info = "#{params[:plan]},#{params[:email_pa]},#{@mobile_no}"
      payment = paypal_payment.subscription_pay_with_paypal(params[:amount], request.base_url+new_subscription_path, request.base_url+sub_paypal_response_path, subscription_info)
      payment_by_account(payment)
    end
  end

  def paypal_response
    app_payment = PaypalPayment.new
    payment_response = app_payment.execute_payment(params[:PayerID], params[:paymentId])
    if payment_response.state == "approved"
      res_hash = Hash.new
      payment_response.to_hash.each do |val|
        if val[0] == "transactions"
          res_hash[:plan_id] = val[1][0].to_a[2][1].split(",")[0]
          res_hash[:email] = val[1][0].to_a[2][1].split(",")[1]
          res_hash[:mobile_no] = val[1][0].to_a[2][1].split(",")[2]
        end
      end
      plan  = SubscriptionPlan.find_by(id: res_hash[:plan_id])
      otp = send_otp(res_hash[:mobile_no])
      @subscription = Subscription.create(
        name: plan.name,
        amount: (plan.amount.to_f/100).round(2),
        active: true,
        customer_id: params[:PayerID],
        card_id: "",
        card_brand: "",
        card_last_4: "",
        card_exp_month: "",
        card_exp_year: "",
        subscription_plan_id: plan.id,
        email: res_hash[:email],
        sub_mobile_no: res_hash[:mobile_no],
        subscription_otp: otp,
        renewal_status: true)
      
      @payment =  Payment.create(
        tender_id: params[:token],
        transaction_id: params[:paymentId],
        location_id: params[:PayerID],
        amount: (plan.amount.to_f/100).round(2),
        card_brand: "",
        card_last_4: "",
        card_exp_month: "",
        card_exp_year: "",
        subscription_id: @subscription.id)
      SaleMailer.subscription_receipt(@subscription, @@params[:email_pa], @@otp_pin).deliver_later
      redirect_to new_user_registration_path, notice: "Please, Sign up yourself, to vote on the project"
    else
      flash[:alert] = payment_response.error.message
      redirect_to new_subscription_path
    end
  end

  def renew
    paypal_payment = PaypalPayment.new
    @plan = SubscriptionPlan.first
    payment = paypal_payment.subscription_pay_with_paypal((@plan.amount.to_f/100).round(2), request.base_url+projects_path, request.base_url+renew_paypal_response_path, "Renewal")
    renew_payment_by_account(payment)
  end

  def renew_paypal_response
    app_payment = PaypalPayment.new
    payment_response = app_payment.execute_payment(params[:PayerID], params[:paymentId])
    if payment_response.state == "approved"
      @plan = SubscriptionPlan.first
      @subscription = current_user.subscriptions.first.update_attributes(
        created_at: Time.zone.now,
        updated_at: Time.zone.now,
        active: true,
        renewal_status: true)
      @payment =  Payment.create(
        tender_id: params[:token],
        transaction_id: params[:paymentId],
        location_id: params[:PayerID],
        amount: (@plan.amount.to_f/100).round(2),
        card_brand: "",
        card_last_4: "",
        card_exp_month: "",
        card_exp_year: "",
        subscription_id: current_user.subscriptions.first.id)
      redirect_to projects_path, notice: "$2.99 Subscription Plan updated successfully!"
    else
      flash[:alert] = payment_response
      redirect_to projects_path
    end
    SaleMailer.subscription_receipt(@subscription, @user.email).deliver_later
  end


  private

  def payment_by_account(payment)
    if payment.create
      @redirect_url = payment.links.find{|v| v.rel == "approval_url" }.href
      redirect_to @redirect_url
    else
      flash[:alert] = payment.error.inspect
      redirect_to checkout_path(current_order) and return
    end
  end

  def renew_payment_by_account(payment)
    if payment.create
      @redirect_url = payment.links.find{|v| v.rel == "approval_url" }.href
      redirect_to @redirect_url
    else
      flash[:alert] = payment.error.inspect
      redirect_to projects_path and return
    end
  end  


  def send_otp(phone_no)
    begin
      otp_pin = rand(0000..9999).to_s.rjust(4, "0")
      client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      response = client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to:   phone_no,
      body: "\nYour OTP for www.greenxprize.com is \n #{otp_pin}")
      return otp_pin
    rescue Twilio::REST::RequestError => e
      return e.message
    end
  end

end
