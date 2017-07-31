describe 'Cart' do
  let!(:product) { Fabricate :product, price: '5000' }

  before do
    visit products_path
    within("#product#{product.id}") do
      fill_in 'order_product_quantity', with: '5'
      click_button 'Add to cart'
    end
  end

  it 'can update the quantity', js: true do
    visit cart_path
    expect(page).to have_content product.name
    fill_in 'order_product_quantity', with: 7
    click_button 'Update Quantity'
    expect(page).to have_content '$35,000'
  end

  it 'can remove the product', js: true do
    visit cart_path
    expect(page).to have_content product.name
    click_link 'Delete'
    page.driver.browser.accept_js_confirms
    expect(page).to have_selector '.shopping-cart'
    expect(page).to have_link 'Back to Store', href: '/products'
  end
end
