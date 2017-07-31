describe 'Admin' do
  context 'when user is signed in' do
    let(:user) { users(:danny) }
    login { user }

    it 'redirects to admin login' do
      visit new_admin_registration_path
      expect(page.current_path).to eq new_admin_session_path
    end
  end

  context 'Signing in' do
    let(:admin) { admins(:super_admin) }

    it 'logs in successfully' do
      visit new_admin_session_path
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: 'metova123'
      click_button 'Sign in'
      expect(page.current_path).to eq admin_root_path
      expect(page).to have_content 'Signed in successfully'
      expect(page).to have_link 'Logout'
    end

    it 'fails to login' do
      visit new_admin_session_path
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: 'incorrect'
      click_button 'Sign in'
      expect(page).to have_content 'Invalid email or password'
    end
  end

  context 'Already signed in as super admin' do
    let(:other_admin) {admins(:admin)}
    let(:admin) {admins(:super_admin)}
    login { admin }

    it 'can update attributes of itself' do
      visit edit_admin_registration_path(admin)
      expect(page).to have_content 'Edit Admin'
      within('.edit_admin') { fill_in 'admin_name', with: 'john doe' }
      click_button 'Save'
      updated_admin = Admin.find admin.id
      expect(page.current_path).to eq admin_root_path
      expect(updated_admin.name).to eq 'john doe'
    end

    it 'can update their own password' do
      visit edit_admin_registration_path(admin)
      expect(page).to have_content 'Edit Admin'
      click_link 'update_password'
      within('.edit_admin') do
        fill_in 'admin_current_password', with: 'metova123'
        fill_in 'admin_password', with: 'new_password'
        fill_in 'admin_password_confirmation', with: 'new_password'
        click_button 'Save'
      end
      expect(page.current_path).to eq new_admin_session_path
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: 'new_password'
      click_button 'Sign in'
      expect(page).to have_link 'Logout'
    end

    it 'can delete other admins but not myself', js: true do
      visit admin_root_path
      expect(page).to have_link 'Delete', count: 1
      page.accept_confirm do
        click_link('Delete')
      end
      expect(page.current_path).to eq admin_root_path
      expect(Admin.count).to eq 1
      expect(Admin.all.pluck(:email)).to include 'wayne.christian@phalinx.com'
    end

    it 'can view all admins on index page' do
      admin_count = Admin.count
      visit admin_root_path
      expect(page).to have_css('.admin-row', count: admin_count)
    end

    it 'can add super_admins on new page' do
      visit new_admin_registration_path
      fill_in 'admin_name', with: 'New Admin'
      fill_in 'admin_email', with: 'new.admin@email.com'
      select 'Super Admin', from: 'admin_role'
      fill_in 'admin_password', with: 'metova123'
      fill_in 'admin_password_confirmation', with: 'metova123'
      expect { click_button 'Save' }.to change { Admin.count }.by 1
    end

  end

  context 'Already signed in as regular admin' do
    let(:admin) { admins(:admin) }
    let(:other_admin) { admins(:super_admin) }
    login { admin }

    it 'cant see super admins on index page' do
      admin_count = Admin.where.not(role: Admin.roles[:super_admin]).count
      visit admin_root_path
      expect(page).to have_css('.admin-row', count: admin_count)
    end

    it 'cant add new admins' do
      visit new_admin_registration_path
      expect(current_path).to eq admin_root_path
      expect(page).to have_content('You are not authorized to perform this action.')
    end
  end
end
