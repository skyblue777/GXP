class Admin::SubscriptionPlansController < Admin::BaseController

  def index
    @subscription_plans = SubscriptionPlan.all
    respond_with @subscription_plans
  end

  def show
    @subscription_plan = find_subscription_plan
    @subscriptions = @subscription_plan.subscriptions
  end

  def new
    @subscription_plan = SubscriptionPlan.new
  end

  def create
    @subscription_plan = SubscriptionPlan.create permitted_params
    respond_with @subscription_plan
  end

  def edit
    @subscription_plan = find_subscription_plan
  end

  def update
    @subscription_plan = find_subscription_plan
    @subscription_plan.update permitted_params
    respond_with @subscription_plan
  end

  def destroy
    @subscription_plan = find_subscription_plan
    @subscription_plan.destroy
    respond_with @subscription_plan
  end

  private

    def permitted_params
      params.require(:subscription_plan).permit :name, :amount, :interval
    end

    def find_subscription_plan
      SubscriptionPlan.find params[:id]
    end

end
