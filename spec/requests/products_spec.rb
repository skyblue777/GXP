describe 'Products' do
  let!(:product) { Fabricate :product, price: '5000' }

  it 'displays the price and description for each product' do
    visit products_path
    expect(page).to have_content product.description
    expect(page).to have_content '$5,000.00'
  end

  it 'can add the correct quantity to the cart' do
    visit products_path
    within("#product#{product.id}") do
      fill_in 'order_product_quantity', with: '5'
      click_button 'Add to cart'
    end
    expect(page).to have_selector 'input#order_product_quantity[value="5"]'
    expect(page).to have_content product.name
  end
end
