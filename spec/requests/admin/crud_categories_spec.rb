describe 'Manage categories' do
  login { admins(:admin) }

  it 'creates a new category' do
    visit admin_categories_path
    click_link 'New'
    fill_in 'category_name', with: 'Test 123'
    click_button 'Save'
    expect(page).to have_content 'Test 123'
    expect(Category.last.name).to eq 'Test 123'
  end

  it 'shows an error when category has a duplicate name' do
    visit new_admin_category_path
    fill_in 'category_name', with: 'Recreation'
    click_button 'Save'
    expect(page).to have_content 'has already been taken'
  end

  it 'shows an error when category name is blank' do
    visit new_admin_category_path
    click_button 'Save'
    expect(page).to have_content "can't be blank"
  end

end
