describe 'Viewing profile' do
  let(:user) { users(:logan) }

  it 'shows the users name, bio, and image' do
    user.update image: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png'))
    visit user_path(user)
    expect(page).to have_content 'Logan Serman'
    expect(page).to have_content 'I am a great developer'
    expect(page).to have_content 'TN'
    expect(page).to have_selector("img[src*='/store/fill/120/120/#{user.reload.image.id}/image']")
  end

  it 'shows info about all of the user\'s projects' do
    visit user_path(user)
    user.projects.each do |project|
      expect(page).to have_content project.name
      expect(page).to have_link 'More', href: project_path(project)
    end
  end

  it 'shows projects the user has voted on' do
    user.votes.create project: projects(:recycling)
    visit user_path(user)
    within '.recent-votes' do
      expect(page).to have_content 'Recycling'
      expect(page).to have_link '', href: project_path(projects(:recycling))
    end
  end

  it 'shows the user has no created if a project if they havent' do
    user.projects.destroy_all
    visit user_path(user)
    expect(page).to have_content 'This user has not submitted any projects!'
  end

  it 'shows the user has not voted if they havent voted' do
    user.votes.destroy_all
    visit user_path(user)
    expect(page).to have_content 'This user has not voted on any projects'
  end

  context 'signed in' do
    login { user }
    it 'links to the edit page' do
      visit user_path(user)
      expect(page).to have_link 'Edit Profile', edit_user_registration_path
    end

    it 'does not link to the edit page when not the current user' do
      visit user_path(users(:danny))
      expect(page).to have_content 'Danny Sperry'
      expect(page).to have_no_link 'Edit Profile'
    end

    it 'provides links for editing the profile or managing subscriptions' do
      visit user_path(user)
      expect(page).to have_link 'Edit Profile', edit_user_registration_path
      expect(page).to have_link 'Manage Membership', new_subscription_path
    end
  end

  describe 'project edit link' do
    let(:project) { projects(:carpooling) }

    context 'signed in as admin of a project' do
      login { user }

      it 'links to the project edit page' do
        visit user_path(user)
        expect(page).to have_link 'Edit', href: edit_project_path(project)
      end
    end

    context 'signed in as non-admin' do
      login { users(:danny) }

      it 'does not link to the project edit page' do
        projects(:carpooling).users << users(:danny)
        visit user_path(user)
        expect(page).to have_no_link 'Edit', href: edit_project_path(project)
      end
    end
  end

  context 'not signed in at all' do
    it 'does not link to the edit user page when not signed in' do
      visit user_path(users(:danny))
      expect(page).to have_content 'Danny Sperry'
      expect(page).to have_no_css '.tr-edit-link'
      expect(page).to have_no_link '', href: edit_user_registration_path
    end

    it 'does not link to the edit project page when not logged in' do
      project = projects(:carpooling)
      visit user_path(user)
      expect(page).to have_no_link '', href: edit_project_path(project)
    end
  end

end
