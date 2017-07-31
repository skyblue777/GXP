describe CartsController do
  let!(:order) { Fabricate :order }
  let!(:products) { Fabricate.times 3, :product, price: 10.99 }

  before do
    products.each do |product|
      order.order_products << (OrderProduct.create order: order, product: product, quantity: 5, price: product.price)
    end
  end

  describe '#show' do
    it 'displays each product in the cart' do
      request.session[:order_id] = order.id
      get :show
      expect(assigns(:order_products)).to eq order.order_products
    end
  end
end
