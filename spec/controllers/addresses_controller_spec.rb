describe AddressesController do
  let!(:order) { Fabricate :order }
  let!(:products) { Fabricate.times 3, :product, price: 10.99 }
  let!(:base_params) { { } }

  before do
    products.each do |product|
      order.order_products << (OrderProduct.create order: order, product: product, quantity: 5, price: product.price)
    end
  end

  describe '#new' do
    context 'when the order does not have an address created yet' do
      it 'assigns a new address' do
        request.session[:order_id] = order.id
        get :new
        expect(assigns(:address)).to be_a_new Address
      end
    end

    context 'when the order already has an address created' do
      let!(:shipping) { Fabricate :address }
      before { order.update shipping_address: shipping }

      it 'does not create a new order and redirects to the order path' do
        request.session[:order_id] = order.id
        expect(get :new).to redirect_to(checkout_path(order))
      end
    end
  end

  describe '#create' do
    it 'creates a new address and assigns it to the order' do
      request.session[:order_id] = order.id
      post :create, base_params.merge(address: { name: 'Test Tester', street: '1234 21st Ave NE', city: 'Test City', state: 'CA', zip: '12345', country: 'US' })
      expect(assigns(:address).name).to eq 'Test Tester'
    end

    it 'redirects to the checkout page if the address is valid' do
      request.session[:order_id] = order.id
      post :create, base_params.merge(address: { name: 'Test Tester', street: '1234 21st Ave NE', city: 'Test City', state: 'CA', zip: '12345', country: 'US' })
      expect(response).to redirect_to(checkout_path(order))
    end

    it 'redirects to the new address page if the address is invalid' do
      request.session[:order_id] = order.id
      post :create, base_params.merge(address: { street: '1234 21st Ave NE', city: 'Test City', state: 'CA', zip: '12345' })
      expect(assigns(:address).name).to be_nil
    end
  end

  describe '#edit' do
    let!(:address) { Fabricate :address }

    it 'assigns the address' do
      put :edit,  base_params.merge(id: address.id)
      expect(assigns(:address)).to eq address
    end
  end

  describe '#update' do
    let!(:address) { Fabricate :address }

    it 'assigns the address' do
      put :update, base_params.merge(id: address.id, address: { name: 'New Name' })
      expect(assigns(:address)).to eq address
    end

    it 'updates the specified parameters' do
      put :update, base_params.merge(id: address.id, address: { name: 'New Name' })
      expect(assigns(:address)).to eq address
      expect(address.reload.name).to eq 'New Name'
    end

    context 'with invalid parameters' do
      subject {put :update,  base_params.merge(id: address.id, address: { name: '' }) }

      it 'does not update the address and redirects to the edit page' do
        expect(subject).to render_template :edit
        expect(address.reload.name).to_not eq ''
      end
    end
  end
end
