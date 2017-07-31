describe 'Voting on a project' do
  let(:user) { users(:karla) }

  context 'havent voted in the contest' do
    login { user }

    it 'increases the project vote count and refreshes the page' do
      project = projects(:recycling)
      visit project_path(project)
      expect(page).to have_no_content 'Voted'
      expect(project.reload.votes.count).to eq 0
      click_link 'Vote for this project'
      expect(page).to have_content 'Voted'
      expect(project.reload.votes.count).to eq 1
    end
  end

  context 'already voted in the contest' do
    login { user }

    it 'switches the vote from one project to another', js: true do
      project = projects(:beehives)
      user.votes.create project: projects(:carpooling)
      visit project_path(project)
      click_link 'Vote for this project'
      expect(page).to have_content '1'
      user.reload
      expect(user.votes.count).to eq 1
      expect(user.project_voted_for_in_contest(project.contest)).to eq projects(:beehives)
    end
  end
end
