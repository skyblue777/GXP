describe 'Orders' do
  let!(:order) { Fabricate :order }
  let!(:product) { Fabricate :product }
  let!(:address) { Fabricate.build :address }

  it 'displays the cart if there are no products in the cart yet' do
    visit '/order'
    expect(page).to have_content 'There are no items in your shopping cart.'
  end

  it 'displays the products in the order' do
    visit products_path
    within("#product#{product.id}") do
      click_button('Add to cart')
    end
    click_link 'Check out Now'
    fill_in 'address_name', with: address.name
    fill_in 'address_street', with: address.street
    fill_in 'address_city', with: address.city
    fill_in 'address_state', with: address.state
    fill_in 'address_zip', with: address.zip
    click_button 'Create Address'
    expect(page).to have_content 'Your Order'
    expect(page).to have_content product.name
  end

  it 'checks out using stripe', js: true do
    visit products_path
    within("#product#{product.id}") do
      click_button('Add to cart')
    end
    click_link 'Check out Now'
    fill_in 'address_name', with: address.name
    fill_in 'address_street', with: address.street
    fill_in 'address_city', with: address.city
    fill_in 'address_state', with: address.state
    fill_in 'address_zip', with: address.zip
    click_button 'Create Address'
    expect(page).to have_content 'Your Order'
    expect(page).to have_content product.name
    expect(page).to have_selector ('.payola-checkout-button')
  end

  describe 'sending a receipt' do
    let!(:new_order) { Fabricate :order }
    let!(:products) { Fabricate.times 3, :product, price: 100, book_download: 'www.test.com' }

    before do
      products.each do |product|
        new_order.order_products << (OrderProduct.create order: new_order, product: product, quantity: 5)
      end
    end

    let!(:sale) { Payola::Sale.create email: 'test@example.com', product: new_order, stripe_token: 'tok_test', currency: 'usd', amount: 100 }

    it 'should send a receipt' do
      mail = Payola::ReceiptMailer.receipt(sale.guid)
      expect(mail.subject).to eq "Green X Order Confirmation - Order ##{sale.guid}"
    end

    it 'should contain any available dowload links' do
      mail = Payola::ReceiptMailer.receipt(sale.guid)
      expect(mail.body.encoded).to include products.first.name
      expect(mail.body.encoded).to include 'www.test.com'
    end

    it 'should contain each redemption code' do
      new_order.receipt_subject(sale)
      new_order.redirect_path(sale)
      expect(new_order.redemption_codes.count).to eq 15
      mail = Payola::ReceiptMailer.receipt(sale.guid)
      new_order.redemption_codes.each do |code|
        expect(mail.body.encoded).to include code.code
      end
    end

    it "should allow product to override subject" do
      mail = Payola::ReceiptMailer.receipt(sale.guid)
      expect(mail.subject).to eq "Green X Order Confirmation - Order ##{sale.guid}"
    end

    it "should allow product to override from address" do
      mail = Payola::ReceiptMailer.receipt(sale.guid)
      expect(mail.from.first).to eq 'taddaquay@gmail.com'
    end

  end
end
