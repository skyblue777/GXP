describe 'User signing in' do
  let(:user) { users(:logan) }

  it 'logs in successfully' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'metova123'
    click_button 'Sign in'
    expect(page.current_path).to eq projects_path
    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_link 'Sign out'
    expect(page).to have_link 'My Profile'
  end

  it 'fails to login' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'incorrect'
    click_button 'Sign in'
    expect(page).to have_content 'Invalid email or password'
  end

  it 'fails to login to admin' do
    visit new_admin_session_path
    fill_in 'admin_email', with: user.email
    fill_in 'admin_password', with: 'metova123'
    click_button 'Sign in'
    expect(page).to have_content 'Invalid email or password'
  end

  it 'redirects to the tried path when forced to sign in' do
    visit projects_path
    click_link I18n.t('root.links.sign_in')
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'metova123'
    click_button 'Sign in'
    expect(page.current_path).to eq projects_path
  end

end
