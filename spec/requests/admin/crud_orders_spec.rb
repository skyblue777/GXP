describe 'Manage orders' do
  login { admins(:admin) }
  let!(:order) { Fabricate :order }
  let!(:redemption_code) { RedemptionCode.create order: order }

  before { order.redemption_codes << redemption_code }

  it 'updates the order' do
    visit admin_orders_path
    within("#order-#{order.id}") do
      click_link 'Edit'
    end
    fill_in 'order_name', with: 'Test 123'
    click_button 'Save'
    expect(page).to have_content 'Test 123'
    expect(order.reload.name).to eq 'Test 123'
  end

  it 'shows an error when order name is blank' do
    visit edit_admin_order_path(order)
    fill_in 'order_name', with: ''
    click_button 'Save'
    expect(page).to have_content "can't be blank"
  end

  it 'displays the user info and redemption codes on show' do
    visit admin_order_path(order)
    expect(page).to have_content(order.billing_address.name)
    expect(page).to have_content(redemption_code.code)
  end

end
