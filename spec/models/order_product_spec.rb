describe OrderProduct do
  let!(:product) { Fabricate :product, price: 100 }
  let!(:op) { Fabricate :order_product, product: product, quantity: 5 }

  it { is_expected.to validate_presence_of :quantity }

  describe '#total_price' do
    it 'returns the total of product price * quantity' do
      expect(op.total_price).to eq 500
    end
  end
end
