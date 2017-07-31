describe 'Project show page' do
  let(:project) { projects(:carpooling) }

  context 'logged in' do
    login { users(:logan) }

    it 'shows the basic project information' do
      visit project_path(project)
      expect(page).to have_content 'Carpooling to Work'
      expect(page).to have_content 'Logan Serman'
      expect(page).to have_content 'ed posuere consectetur est at lobortis.'
    end

    it 'shows the vote count' do
      visit project_path(project)
      expect(page).to have_content '0'
      project.votes.create user: users(:danny)
      visit project_path(project)
      expect(page).to have_content '1'
    end

    it 'doesnt have a vote button if its my project' do
      visit project_path(project)
      expect(page).to have_no_link 'Vote for this project'
    end

    it 'has a vote button if its someone elses project' do
      visit project_path(projects(:recycling))
      expect(page).to have_link 'Vote for this project'
    end

    it 'shows that I voted if Ive voted on this project' do
      project = projects(:recycling)
      project.votes.create user: users(:logan)
      visit project_path(project)
      expect(page).to have_content 'Voted'
    end

    it 'does not show the video box if there is no video' do
      expect(project.has_video?).to be false
      visit project_path(project)
      expect(page).to have_content 'Carpooling'
      expect(all('video').count).to be_zero
    end

    it 'shows the video box if there is a video' do
      pending
      project.update! video: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test-video.mov'))
      project.images.first.update! image: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png'))
      visit project_path(project)
      expect(all('video').count).to eq 1
    end

    it 'must be finalized before it shows up on the main page' do
      project = projects(:carpooling)
      project.images.first.update! image: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png'))
      project.update! finalized: false
      visit projects_path
      expect(page).to have_no_content 'Carpooling to Work'
      project.update! finalized: true
      visit projects_path
      expect(page).to have_content 'Carpooling to Work'
    end

    it 'must be finalized before it is viewable by ID to a non-project user' do
      project = projects(:recycling)
      project.images.first.update! image: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png'))
      project.update! finalized: false
      visit project_path(project)
      expect(page).to have_content 'You are not authorized to perform this action.'
      project.update! finalized: true
      visit project_path(project)
      expect(page).to have_content 'Recycling'
    end

    it 'shows the time remaining', js: true do
      visit project_path(project)
      expect(page.text).to match /\d+d\s\d+h\s\d+m\s\d+s\sremaining/
    end

    it 'does not show the time remaining if the contest is over', js: true do
      project.contest.update ends_at: 5.minutes.ago
      visit project_path(project)
      expect(page.text).to_not match /\d+d\s\d+h\s\d+m\s\d+s\sremaining/
    end
  end

  context 'logged out' do
    it 'does not have a vote button' do
      visit project_path(project)
      expect(page).to have_content 'Carpooling to Work'
      expect(page).to have_no_link 'Vote for this project'
    end
  end

  context 'logged in with an inactive account' do
    before { users(:logan).update redemption_code: nil }
    login { users(:logan) }

    it 'does not have a vote button' do
      visit project_path(project)
      expect(page).to have_content 'Carpooling to Work'
      expect(page).to have_no_link 'Vote for this project'
    end
  end

  context 'when logged in with a subscription' do
    before do
      payola_subscriptions(:first).update owner: users(:logan)
      users(:logan).update payola_subscription: payola_subscriptions(:first)
    end
    login { users(:logan) }

    it 'has a vote button' do
      visit project_path(projects(:recycling))
      expect(page).to have_link 'Vote for this project'
    end
  end
end
