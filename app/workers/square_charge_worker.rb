class SquareChargeWorker
  include Sidekiq::Worker

  def perform(customer_id, card_id, amount, subscription_id, user_id)
    square = Square.new
    charge = square.charge_recurring(customer_id, card_id, amount, subscription_id, user_id)
  end
end
