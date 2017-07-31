desc "This task is called by the Heroku scheduler add-on"
task :charge_subscriptions => :environment do
  # sqlite query
  if Rails.env.development?
    subscriptions = Subscription.where("cast(strftime('%d', created_at) as int) = ? AND active = ?", Date.today.day, true)
  else
    subscriptions = Subscription.where("extract(day from created_at) = ? AND active = ?", Date.today.day, true)
  end
  subscriptions.each do |subscription|
    SquareChargeWorker.perform_async(subscription.customer_id, subscription.card_id, subscription.amount, subscription.id, subscription.user_id)
  end
end

