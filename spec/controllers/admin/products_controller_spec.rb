describe Admin::ProductsController do
  let!(:product) { Fabricate :product }
  let!(:admin) { Fabricate :admin }

  describe '#edit' do
    it 'finds and sets @product' do
      expect(Product).to receive(:find).and_call_original
      sign_in admin
      get :edit, id: product.id
      expect(assigns(:product)).to eq(product)
    end
  end
  describe '#new' do
    it 'instantiates a new product' do
      sign_in admin
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe '#destroy' do
    it 'finds the record' do
      sign_in admin
      expect(Product).to receive(:find).with(product.id.to_s).and_call_original
      delete :destroy, id: product.id
    end

    it 'destroys the record' do
      sign_in admin
      expect { delete :destroy, id: product.id}.to change(Product, :count).by(-1)
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
