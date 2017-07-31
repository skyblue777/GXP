describe OrderProductsController do
  let!(:order) { Fabricate :order }
  let!(:product) { Fabricate :product }
  let!(:base_params) { { } }

  describe '#create' do
    it 'sets the appropriate variables' do
      request.session[:order_id] = order.id
      post :create, base_params.merge(order_product: { product_id: product.id, quantity: 5 })
      expect(assigns(:order).order_products.first.product).to eq product
    end
  end

  describe '#update' do
    let!(:products) { Fabricate.times 3, :product, price: 10.99 }

    before do
      products.each do |product|
        order.order_products << (OrderProduct.create order: order, product: product, quantity: 5, price: product.price)
      end
    end

    it 'sets the appropriate variables' do
      request.session[:order_id] = order.id
      put :update, base_params.merge(id: order.order_products.first.id, order_product: { quantity: 7 })
      expect(assigns(:order_product)).to eq order.order_products.first
      expect(assigns(:order)).to eq order
    end

    it 'updates the order product' do
      request.session[:order_id] = order.id
      expect(order.order_products.first.quantity).to eq 5
      put :update, base_params.merge(id: order.order_products.first.id, order_product: { quantity: 7 })
      expect(assigns(:order_product)).to eq order.order_products.first
      expect(order.order_products.first.reload.quantity).to eq 7
    end
  end

  describe '#destroy' do
    let!(:products) { Fabricate.times 3, :product, price: 10.99 }

    before do
      products.each do |product|
        order.order_products << (OrderProduct.create order: order, product: product, quantity: 5, price: product.price)
      end
    end

    it 'deletes the associated order product' do
      request.session[:order_id] = order.id
      op_id = order.order_products.first.id
      expect(OrderProduct.find(op_id)).to be_present
      put :destroy, base_params.merge(id: op_id, format: 'js')
      expect(OrderProduct.where(id: op_id)).to be_empty
    end
  end
end
