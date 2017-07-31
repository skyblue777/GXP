describe 'Inviting users to a project via group', js: true do
  let(:project) { projects(:carpooling) }
  let(:user) { users(:logan) }
  login { user }

  it 'accepts e-mail addresses into a textbox and they are added to a list when hitting enter' do
    invite 'test@metova.com', wait: false
    within '.invited-users' do
      expect(page).to have_content 'test@metova.com'
    end
  end

  it 'does not send emails to users that are already in the group' do
    pending
    invite 'logan.serman@metova.com'
    perform_enqueued_jobs do
      click_button 'Next'
      expect(page).to have_content 'Carpooling'
    end
    expect(ActionMailer::Base.deliveries).to be_empty
  end

  it 'does not send multiple emails to the same person' do
    pending
    3.times { invite 'danny.sperry@metova.com' }
    perform_enqueued_jobs do
      click_button 'Next'
      expect(page).to have_content 'Carpooling'
    end
    expect(ActionMailer::Base.deliveries.size).to eq 1
  end

  context 'user already exists' do
    it 'shows the users name along with the e-mail in the list' do
      invite 'danny.sperry@metova.com', wait: false
      within '.invited-users' do
        expect(page).to have_content 'Danny Sperry (danny.sperry@metova.com)'
      end
    end

    it 'sends an invite link out to users that already exist in the database' do
      pending
      invite 'danny.sperry@metova.com'
      perform_enqueued_jobs do
        click_button 'Next'
        expect(page).to have_content 'Carpooling'
      end

      email = ActionMailer::Base.deliveries[0]
      code = GroupInvitation.last.code
      expect(email).to be_present
      expect(email.to).to match_array ['danny.sperry@metova.com']
      expect(email.body.encoded).to include "group_invitations/accept?invitation_code=#{code}"
    end

    it 'accepts the invitation and adds the user to the group' do
      pending
      invite 'danny.sperry@metova.com'
      perform_enqueued_jobs do
        click_button 'Next'
        expect(page).to have_content 'Carpooling'
      end

      click_link 'Sign out'
      click_link 'Sign in'
      fill_in 'user_email', with: 'danny.sperry@metova.com'
      fill_in 'user_password', with: 'metova123'
      click_button 'Sign in'
      expect(page).to have_link 'Sign out'

      code = GroupInvitation.last.code
      visit accept_group_invitations_path(invitation_code: code)
      expect(page).to have_content 'You have been added to this project!'
      expect(project.reload.users.pluck(:email)).to include 'danny.sperry@metova.com'
    end
  end

  context 'user does not exist' do
    it 'sends a sign up link with an invite code' do
      pending
      invite 'test@metova.com'
      perform_enqueued_jobs do
        click_button 'Next'
        expect(page).to have_content 'Carpooling'
      end

      email = ActionMailer::Base.deliveries[0]
      code = GroupInvitation.last.code
      expect(email).to be_present
      expect(email.to).to match_array ['test@metova.com']
      expect(email.body.encoded).to include "users/register?invitation_code=#{code}"
    end

    it 'automatically adds users who sign up with an invite code to the project after sign up' do
      invite 'test@metova.com'
      click_button 'Next'
      code = GroupInvitation.last.code
      expect(project.users.pluck(:email)).to match_array ['logan.serman@metova.com']
      click_link 'Sign out'
      visit new_user_registration_path(invitation_code: GroupInvitation.last.code)
      fill_in 'user_name', with: 'Test'
      fill_in 'user_password', with: 'metova123'
      fill_in 'user_password_confirmation', with: 'metova123'
      fill_in 'user_location', with: '12345'
      page.check 'I agree to the terms of service'
      click_button 'Sign up'
      expect(page).to have_link 'Sign out'
      expect(project.reload.users.pluck(:email)).to include 'test@metova.com'
    end
  end

  def invite(email, wait: true)
    if page.current_path != step2_project_path(project)
      visit step2_project_path(project)
      click_link 'Group or Organization'
    end
    fill_in 'group_name', with: 'Metova'
    fill_in 'group_bio', with: 'Test'
    fill_in 'group_invited_user_email', with: email + "\n"
    return unless wait
    within '.invited-users' do
      expect(page).to have_content email
    end
  end

end
