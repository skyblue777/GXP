describe 'Manage contests' do
  login { admins(:admin) }

  it 'creates a new contest' do
    visit admin_contests_path
    click_link 'New'
    fill_in 'contest_name', with: 'Test 123'
    fill_in 'contest_slug', with: 'slug'
    fill_in 'contest_starts_at', with: 1.hour.from_now.strftime('%Y-%m-%d %I:%M %p')
    fill_in 'contest_ends_at', with: 2.hours.from_now.strftime('%Y-%m-%d %I:%M %p')
    click_button 'Save'
    expect(page).to have_content 'Test 123'
    expect(Contest.last.name).to eq 'Test 123'
    expect(page).to have_link 'slug', contest_path('slug')
  end

  it 'shows an error when contest has a duplicate slug' do
    visit new_admin_contest_path
    fill_in 'contest_slug', with: '10k'
    click_button 'Save'
    expect(page).to have_content 'has already been taken'
  end

  it 'shows an error when contest name is blank' do
    visit new_admin_contest_path
    fill_in 'contest_slug', with: 'slug'
    click_button 'Save'
    expect(page).to have_content "can't be blank"
  end

  it 'changes the main contest' do
    visit edit_admin_contest_path(contests(:franklin))
    find('#contest_main').set(true)
    click_button 'Save'
    expect(contests(:franklin).reload).to be_main
    expect(contests(:tenK).reload).to_not be_main
  end

end
