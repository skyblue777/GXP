class UsersController < ApplicationController
  include ApplicationHelper
  authenticated! only: :profile
  respond_to :json

  def index
    @users = User.where email: params[:email]
    @invited_user = !GroupInvitation.where("group_id = ? AND email = ?", params[:group_id], params[:email]).blank?
    respond_with @users, @invited_user
  end

  def show
    @user ||= User.find params[:id]
    @projects = @user.projects
    @subscription = @user.subscriptions.first
    @recent_voted_on_projects = @user.projects_voted_for.by_time_of_vote
    @audio_book = ""
    @ebook = ""
    @user.orders.each do |ord|
      OrderProduct.where("order_id = ?", ord.id).each do |ord_prd|
        if ProductPrice.find_by(id: ord_prd.product_price_id).book_type == "Audio"
          @audio_book = books_prices_for_cart(5, op_product(ord_prd.product_price_id))
        end
        if ProductPrice.find_by(id: ord_prd.product_price_id).book_type == "Ebook"
          @ebook = books_prices_for_cart(6, op_product(ord_prd.product_price_id))
        end
      end
    end
    @users_orders = @user.orders.where("tracking_number != null OR tracking_number != ''")
  end

  def users_order
    @tracked_data = { "carrier": "usps",
                      "tracking_number": "9205590164917312751089",
                      "address_from": {
                        "city": "Las Vegas",
                        "state": "NV",
                        "zip": "89101",
                        "country": "US"
                      },
                      "address_to": {
                        "city": "Spotsylvania",
                        "state": "VA",
                        "zip": "22551",
                        "country": "US"
                      },
                      "eta": "2016-07-23T00:00:00Z",
                      "servicelevel": {
                        "token": "usps_priority",
                        "name": "Priority Mail"
                      },
                      "metadata": "null",
                      "tracking_status": {
                        "object_created": "2016-07-23T20:35:26.129Z",
                        "object_updated": "2016-07-23T20:35:26.129Z",
                        "object_id": "ce48ff3d52a34e91b77aa98370182624",
                        "status": "DELIVERED",
                        "status_details": "Your shipment has been delivered at the destination mailbox.",
                        "status_date": "2016-07-23T13:03:00Z",
                        "location": {
                          "city": "Spotsylvania",
                          "state": "VA",
                          "zip": "22551",
                          "country": "US"
                        }
                      },
                      "tracking_history": [
                        {
                          "object_created": "2016-07-22T14:36:50.943Z",
                          "object_id": "265c7a7c23354da5b87b2bf52656c625",
                          "status": "TRANSIT",
                          "status_details": "Your shipment has been accepted.",
                          "status_date": "2016-07-21T15:33:00Z",
                          "location": {
                            "city": "Las Vegas",
                            "state": "NV",
                            "zip": "89101",
                            "country": "US"
                          }
                        },

                        {
                          "object_created": "2016-07-23T20:35:26.129Z",
                          "object_id": "aab1d7c0559d43ccbba4ff8603089e56",
                          "status": "DELIVERED",
                          "status_details": "Your shipment has been delivered at the destination mailbox.",
                          "status_date": "2016-07-23T13:03:00Z",
                          "location": {
                            "city": "Spotsylvania",
                            "state": "VA",
                            "zip": "22551",
                            "country": "US"
                          }
                        }
                      ]
                    }

    order = Order.find_by(id: params[:order_id])
    if order.tracking_number != "" && !order.tracking_number.nil?
      uri = URI.parse("https://api.goshippo.com/tracks/")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production    
      request = Net::HTTP::Post.new(uri.request_uri, { :Authorization => "ShippoToken shippo_test_8750275c450dd5b56894cf3eb2893cfcf1560b83", "Content-Type" => "application/json" })
      request.set_form_data({carrier:  "usps", tracking_number: order.tracking_number})
      response = http.request(request)
      if response.message == "CREATED"
        # @tracked_data = response
      end
    end

  end

  def profile
    @user = current_user
    show
    render :show
  end

  def update_code
    @user = current_user
    @user.update code_permitted_params
    if @user.redemption_code.present? && !@user.errors
      @user.payola_subscription.try(:destroy)
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages[0] || 'Code must be present'
      render '/subscriptions/new'
    end
  end

  private
    def code_permitted_params
      params.require(:user).permit(:redemption_code)
    end
end
