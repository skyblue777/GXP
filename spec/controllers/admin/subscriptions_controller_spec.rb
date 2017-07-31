describe Admin::SubscriptionsController do
  let!(:subscription) { Fabricate :subscription }
  let!(:admin) { Fabricate :admin }

  describe "GET #show" do
    it "finds and sets @subscription" do
      sign_in admin
      get :show, id: subscription.id
      expect(assigns(:subscription)).to eq(subscription)
    end
  end
  describe "GET #index" do
    it "returns http success" do
      sign_in admin
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #destroy" do
    it "destroys the records" do
      sign_in admin
      expect { delete :destroy, id: subscription.id}.to change(Subscription, :count).by(-1)
    end
  end
  describe "GET #enable" do
    it "activates the subscription" do
      sign_in admin
      request.env["HTTP_REFERER"] = admin_subscription_path(subscription)
      get :enable, id: subscription.id
      expect(assigns(:subscription).active).to eq true
    end
  end
  describe "GET #disable" do
    it "deactivates the subscription" do
      sign_in admin
      request.env["HTTP_REFERER"] = admin_subscription_path(subscription)
      get :disable, id: subscription.id
      expect(assigns(:subscription).active).to eq false
    end
  end
end
