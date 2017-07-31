describe 'Updating profile' do
  let(:user) { users(:logan) }
  login { user }

  it 'updates name, email, website, location and bio' do
    visit edit_user_registration_path
    fill_in 'user_name', with: 'Test 123'
    fill_in 'user_email', with: 'test123@email.com'
    fill_in 'user_website', with: 'test123.com'
    fill_in 'user_bio', with: 'Test 123 123 123'
    fill_in 'user_location', with: '12345'
    click_button 'Update'
    user.reload
    expect(user.name).to eq 'Test 123'
    expect(user.email).to eq 'test123@email.com'
    expect(user.website).to eq 'test123.com'
    expect(user.bio).to eq 'Test 123 123 123'
    expect(user.location).to eq '12345'
    expect(page.current_path).to eq edit_user_registration_path
    expect(page).to have_content 'Your account has been updated successfully'
  end

  # it 'shows a placeholder image by default' do
  #   visit edit_user_registration_path
  #   expect(page).to have_xpath("//img[@src='/assets/silhouette-small.png']")
  #   expect(page).to have_xpath("//img[@src='/assets/silhouette-large.png']")
  # end

  it 'shows the image from store when job is done moving it there' do
    visit edit_user_registration_path
    attach_file 'user_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
    click_button 'Update'
    visit edit_user_registration_path
    image = find('.silhouette img')
    expect(page).to have_selector("img[src*='/store/fill/']")
  end

  # it 'shows a profile link when logged in with image placeholder if no image' do
  #   expect(page).to have_link '', href: profile_users_path
  #   within '.edit-profile' do
  #     expect(page).to have_xpath "//img[@src='/assets/silhouette-small.png']"
  #   end
  # end

  # it 'shows a profile link with their profile picture' do
  #   visit edit_user_registration_path
  #   attach_file 'user_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
  #   click_button 'Update'
  #   within '.edit-profile' do
  #     expect(page).to have_xpath "//img[@src='/attachments/store/fill/80/80/#{user.reload.image.id}/image']"
  #   end
  # end

  it 'doesnt show a profile link if logged out' do
    click_link 'Sign out'
    expect(page).to have_no_link '', href: profile_users_path
  end

end
