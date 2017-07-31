class SaleMailer < ApplicationMailer
  def receipt(order, otp)
    @order = order
    @otp  = otp.blank? ? "" : "Your OTP for www.greenxprize.com is #{otp}"
    mail to: @order.email, from: "noreply@greenxprize.com", subject: "Green X Order Confirmation - Order ##{@order.name}"
  end

  def subscription_receipt(subscription, email, otp)
    @subscription = subscription
    @otp = otp
    mail to: email, from: "noreply@greenxprize.com", subject: "Green X Subscription Confirmation"
  end

  def admin_notice(payment)
    @payment = payment
    mail to: "daveedchun@gmail.com", from: "noreply@greenxprize.com", subject: "Green X Payment Notice"
  end

  def receipt_by_admin(order)
    @orders = order.order_products
    @total = order.order_products.sum("price * quantity")
    @address = Address.find_by(id: order.shipping_address_id)
    
    message = "Product Details:"
    @orders.each do |ord|
      message += "Product Name: #{ord.name } \n Product Type: #{ProductPrice.find_by(id: ord.product_price_id).book_type } \n Description: #{ord.description} \n Product Qty: #{ord.quantity} \n Product Price: #{ord.price} \n"
    end
    message += "Total Price: #{@orders.sum(:price)}"
    AdminMobEmail.all.pluck(:code, :admin_mobile_no).map(&:join).each do |mob_no|
      client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      response = client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to:   mob_no,
      body: "#{message}")
    end




    mail to: AdminMobEmail.all.pluck(:admin_email), subject: "Customer New Order"
  end
end
