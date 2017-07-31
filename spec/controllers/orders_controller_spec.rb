describe OrdersController do
  let!(:order) { Fabricate :order }
  let!(:products) { Fabricate.times 3, :product, price: 10.99 }

  before do
    products.each do |product|
      order.order_products << (OrderProduct.create order: order, product: product, quantity: 5, price: product.price)
    end
  end

  describe '#complete' do
    it 'sets the current order' do
      request.session[:order_id] = order.id
      get :complete, id: order.name
      expect(assigns(:order)).to eq order
    end
  end
end
