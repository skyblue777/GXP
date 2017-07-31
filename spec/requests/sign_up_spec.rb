describe 'Signing up' do
  it 'creates an account' do
    visit new_user_registration_path
    fill_in 'user_name', with: 'Test Testerson'
    fill_in 'user_email', with: 'test@testerson.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    fill_in 'user_location', with: '12345'
    page.check 'I agree to the terms of service'
    click_button 'Sign up'

    expect(page.current_path).to eq new_subscription_path
    expect(page).to have_link 'Sign out'
    expect(User.last.name).to eq 'Test Testerson'
  end

  it 'sets the redemption code on the next page' do
    visit new_user_registration_path
    fill_in 'user_name', with: 'Test Testerson'
    fill_in 'user_email', with: 'test@testerson.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    fill_in 'user_location', with: '12345'
    page.check 'I agree to the terms of service'
    click_button 'Sign up'

    expect(page.current_path).to eq new_subscription_path

    fill_in 'user_redemption_code', with: 'test123'
    click_button 'Submit Code'
    expect(page).to have_content 'Congratulations'
  end

  context 'validation errors' do
    it 'shows presence errors' do
      visit new_user_registration_path
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: 'test@testerson.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      fill_in 'user_location', with: '12345'
      page.check 'I agree to the terms of service'

      expect { click_button 'Sign up' }.to_not change(User, :count)
      expect(page).to have_content "can't be blank"
    end

    it 'shows invalid redemption code error' do
      visit new_user_registration_path
      fill_in 'user_name', with: 'Test Testerson'
      fill_in 'user_email', with: 'test@testerson.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      fill_in 'user_location', with: '12345'
      page.check 'I agree to the terms of service'
      click_button 'Sign up'

      expect_any_instance_of(RedemptionCodeValidator).to receive(:code_invalid?) { true }
      fill_in 'user_redemption_code', with: SecureRandom.hex
      click_button 'Submit Code'
      expect(page).to have_content 'is not valid'
      expect(User.last.redemption_code).to be_nil
    end

    it 'shows already taken redemption code error' do
      visit new_user_registration_path
      fill_in 'user_name', with: 'Test Testerson'
      fill_in 'user_email', with: 'test@testerson.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      fill_in 'user_location', with: '12345'
      page.check 'I agree to the terms of service'

      click_button 'Sign up'
      fill_in 'user_redemption_code', with: 'code123'
      click_button 'Submit Code'
      expect(page).to have_content 'has already been taken'
      expect(User.last.redemption_code).to be_nil
    end
  end

end
