describe 'Manage products' do
  login { admins(:admin) }

  it 'creates a new product' do
    visit admin_products_path
    click_link 'New'
    fill_in 'product_name', with: 'Test 123'
    fill_in 'product_description', with: 'This is a product description.'
    fill_in 'product_price', with: 500
    attach_file 'product_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
    click_button 'Save'
    expect(page).to have_content 'Test 123'
    expect(Product.last.name).to eq 'Test 123'
  end

  it 'shows an error when product has a duplicate name' do
    visit new_admin_product_path
    fill_in 'product_name', with: 'Hardback Book'
    attach_file 'product_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
    click_button 'Save'
    expect(page).to have_content 'has already been taken'
  end

  it 'shows an error when product name is blank' do
    visit new_admin_product_path
    fill_in 'product_price', with: 500
    click_button 'Save'
    expect(page).to have_content "can't be blank"
  end

end
