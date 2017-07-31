class Admin::PaymentsController < Admin::BaseController

  def refund
    payment = Payment.find(params["id"])
    app_payment = PaypalPayment.new
    app_payment.paypal_refund(payment)
    square = Square.new
    refund_response = square.refund(payment.transaction_id, payment.tender_id, payment.amount, payment.id, payment.order_id, payment.subscription_id)
    if refund_response.try(:refund)
      redirect_to :back, notice: "Transaction has been refunded. More details can be found in your Square Dashboard."
    else
      redirect_to :back, alert: refund_response
    end
  end

end