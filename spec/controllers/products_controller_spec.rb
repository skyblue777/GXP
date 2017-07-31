describe ProductsController do
  let!(:products) { Fabricate.times 3, :product, price: 10.99 }

  describe '#index' do
    it 'assigns the products' do
      get :index
      expect(assigns(:products)).to eq Product.all
    end

    it 'creates an order product for the current order to add to cart' do
      get :index
      expect(assigns(:order_product)).to be_a_new OrderProduct
    end
  end
end
