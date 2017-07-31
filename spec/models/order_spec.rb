describe Order do
  let!(:order) { Fabricate :order }
  let!(:products) { Fabricate.times 3, :product, price: 100 }

  before do
    products.each do |product|
      order.order_products << (OrderProduct.create order: order, product: product, quantity: 5)
    end
  end

  it { is_expected.to have_many(:products).through(:order_products) }
  it { is_expected.to belong_to(:billing_address) }
  it { is_expected.to belong_to(:shipping_address) }
  it { is_expected.to enumerize(:shipped).in(:new, :shipped) }
  it { is_expected.to have_many(:redemption_codes) }

  describe '#calculate_subtotal' do
    it 'returns the sum of the cost for each product based on its price and quantity' do
      expect(order.calculate_subtotal).to eq 1500
    end
  end

  describe '#calculate_tax' do
    it 'returns the subtotal * the current tax rate' do
      expect(order.calculate_tax).to eq Order::TAX_RATE * order.subtotal
    end
  end

  describe '#calculate_shipping' do
    it 'returns the number of items * the rate per item' do
      expect(order.calculate_shipping).to eq Order::SHIPPING_RATE * order.product_count
    end
  end

  describe '#product_count' do
    it 'returns the number of products in the order' do
      expect(order.product_count).to eq 15
    end
  end

  describe '#redirect_path' do
    it 'sets the order to complete' do
      sale = instance_double("Payola::Sale", id: 250)
      expect(order.complete).to be_falsy
      order.redirect_path(sale)
      expect(order.complete).to be_truthy
    end
  end

  describe '#receipt_subject' do
    it 'creates a new redemption_code for each product' do
      sale = instance_double("Payola::Sale", id: 250, guid: 'test2345')
      expect(order.complete).to be_falsy
      expect do
        order.receipt_subject(sale)
      end.to change(RedemptionCode, :count).by 15

      expect(order.redemption_codes.count).to eq 15
    end
  end

  describe 'creating a new order' do
    let!(:order_new) { Fabricate.build :order, complete: false }

    before do
      products.each do |product|
        order_new.order_products << (OrderProduct.create order: order_new, product: product, quantity: 5)
      end

      order_new.save
    end

    it 'updates the totals according to the products' do
      expect(order_new.subtotal).to eq 1500
      expect(order_new.complete).to be_falsy
    end

    it 'is complete once the redirect path has been called' do
      sale = instance_double("Payola::Sale", :id => 250)
      expect(order_new.complete).to be_falsy
      order_new.redirect_path(sale)
      expect(order_new.complete).to be_truthy
    end
  end
end
