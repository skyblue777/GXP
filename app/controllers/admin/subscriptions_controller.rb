class Admin::SubscriptionsController < Admin::BaseController
  def show
    @subscription = find_subscription
    @payment = Payment.find_by(subscription_id: @subscription.id)
  end

  def index
    @subscriptions = Subscription.all.order(created_at: :desc)
    respond_with @subscriptions
  end

  def edit
    @subscription = Subscription.find_by(id: params[:id])
  end

  def destroy
    @subscription = find_subscription
    @subscription.payments.destroy_all
    @subscription.destroy
    respond_with @subscription
  end

  def disable
    @subscription = find_subscription
    @subscription.update_attribute(:active, false)
    redirect_to :back, notice: "Subscription disabled."
  end

  def enable
    @subscription = find_subscription
    @subscription.update_attribute(:active, true)
    redirect_to :back, notice: "Subscription enabled."
  end

  private

    def permitted_params
      params.require(:subscription).permit :active
    end

    def find_subscription
      Subscription.find(params[:id])
    end
end
