describe Admin::SubscriptionPlansController do
  let!(:subscription_plan) { Fabricate :subscription_plan }
  let!(:admin) { Fabricate :admin }

  describe '#edit' do
    it 'finds and sets @subscription_plan' do
      expect(SubscriptionPlan).to receive(:find).and_call_original
      sign_in admin
      get :edit, id: subscription_plan.id
      expect(assigns(:subscription_plan)).to eq(subscription_plan)
    end
  end
  describe '#new' do
    it 'instantiates a new subscription_plan' do
      sign_in admin
      get :new
      expect(assigns(:subscription_plan)).to be_a_new(SubscriptionPlan)
    end
  end

  describe '#destroy' do
    it 'finds the record' do
      sign_in admin
      expect(SubscriptionPlan).to receive(:find).with(subscription_plan.id.to_s).and_call_original
      delete :destroy, id: subscription_plan.id
    end

    it 'destroys the record' do
      sign_in admin
      expect { delete :destroy, id: subscription_plan.id}.to change(SubscriptionPlan, :count).by(-1)
    end
  end

  describe '#show' do
    it 'assigns the subscription_plan' do
      sign_in admin
      get :show, id: subscription_plan.id
      expect(assigns(:subscription_plan)).to eq(subscription_plan)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      sign_in admin
      get :index
      expect(response).to have_http_status(:success)
    end
  end  
end
