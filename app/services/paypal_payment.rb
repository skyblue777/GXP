class PaypalPayment
  require 'paypal-sdk-rest'
  include PayPal::SDK::REST
  include PayPal::SDK::Core::Logging  
  include ApplicationHelper
  def initialize(params = {})
    @nonce = params[:params]
    @order = params[:order]
  end

  def execute_payment(payer_id, payment_id)
    payment = Payment.find(payment_id)
    payment.execute(payer_id: payer_id) unless payment.error
    payment
  end


  def pay_with_card
    @payment = Payment.new({
      :intent => "sale",
      :payer => {
        :payment_method => "credit_card",
        :funding_instruments => [{
          :credit_card => {
            :type => "#{@nonce[:card_type]}",
            :number => "#{@nonce[:card_no]}",
            :expire_month => "#{@nonce[:card_expiration_date].first(2)}",
            :expire_year => "#{Time.zone.now.to_date.year.to_s.first(2)+@nonce[:card_expiration_date].last(2)}",
            :cvv2 => "#{@nonce[:card_cvv]}",
            :first_name => "*",
            :last_name => "*",
            :billing_address => {
              :line1 => "*",
              :city => "*",
              :state => "*",
              :postal_code => "00",
              :country_code => "US" }}}]},
      :transactions => [{

        # Item List
        :item_list => {
          :items => [{
            :name => "item",
            :sku => "item",
            :price => "#{@nonce[:amount].to_f.round(2)}",
            :currency => "USD",
            :quantity => 1 }]},

        # ###Amount
        # Let's you specify a payment amount.
        :amount => {
          :total => "#{@nonce[:amount].to_f.round(2)}",
          :currency => "USD" },
        :description => "This is the payment transaction description." }]})

  end


  def order_pay_with_paypal(order, amount, cancel_url, return_url, order_info)
    items = []
    order.order_products.each do |ord|
      items << {:name => "Name: #{ord.name}", 
                :sku => "Type:#{book_type(ord.product_price_id)}", 
                :price => "#{(ord.price/ord.quantity).to_f.round(2)}", 
                :currency => "USD",
                :quantity => "#{ord.quantity}" }
    end

    tax = amount.to_f.round(2) - order.order_products.sum(:price).to_f.round(2)
    items << {:name => "Shiping Tax", 
                :sku => "Shiping Tax", 
                :price => "#{tax.to_f.round(2)}", 
                :currency => "USD",
                :quantity => 1 }
    payment = Payment.new({
      :intent =>  "sale",
      :payer =>  {
        :payment_method =>  "paypal" },

      # ###Redirect URLs
      :redirect_urls => {
        :return_url => "#{return_url}",
        :cancel_url => "#{cancel_url}" },
      :transactions =>  [{

        # Item List
        :item_list => {
          :items => items},
        :amount =>  {
          :total =>  "#{(order.order_products.sum(:price) + tax).to_f.round(2)}",
          :currency =>  "USD" },
        :description =>  order_info }]})
    return payment    
  end


  def subscription_pay_with_paypal(amount, cancel_url, return_url, subscription_info)
    payment = Payment.new({
      :intent =>  "sale",
      :payer =>  {
        :payment_method =>  "paypal" },

      # ###Redirect URLs
      :redirect_urls => {
        :return_url => "#{return_url}",
        :cancel_url => "#{cancel_url}" },
      :transactions =>  [{

        # Item List
        :item_list => {
          :items => [{
            :name => "Monthly Subscription",
            :sku => "Monthly Subscription",
            :price => "#{amount.to_f.round(2)}",
            :currency => "USD",
            :quantity => 1 }]},
        :amount =>  {
          :total =>  "#{amount.to_f.round(2)}",
          :currency =>  "USD" },
        :description =>  subscription_info }]})
  end

  def paypal_refund(payment)
    @sale = Sale.find("7DY409201T7922549")
    # Make Refund API call
    # Set amount only if the refund is partial
    @refund = @sale.refund_request({
      :amount => {
      :total => "0.01",
      :currency => "USD" } })
    # Check refund status
    if @refund.success?
      logger.info "Refund[#{@refund.id}] Success"
    else
      logger.error "Unable to Refund"
      logger.error @refund.error.inspect
    end    
  end

end