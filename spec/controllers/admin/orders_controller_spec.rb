describe Admin::OrdersController do
  let!(:order) { Fabricate :order }
  let!(:admin) { Fabricate :admin }

  describe '#edit' do
    it 'finds and sets @order' do
      expect(Order).to receive(:find).and_call_original
      sign_in admin
      get :edit, id: order.id
      expect(assigns(:order)).to eq(order)
    end
  end

  describe '#destroy' do
    it 'finds the record' do
      sign_in admin
      expect(Order).to receive(:find).with(order.id.to_s).and_call_original
      delete :destroy, id: order.id
    end

    it 'destroys the record' do
      sign_in admin
      expect { delete :destroy, id: order.id}.to change(Order, :count).by(-1)
    end
  end

  describe '#show' do
    it 'assigns the order' do
      sign_in admin
      get :show, id: order.id
      expect(assigns(:order)).to eq(order)
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
