describe 'Creating contests' do

  context 'while logged in as admin' do
    let(:admin) { admins(:admin) }
    login { admin }

    it 'submits a new contest' do
      visit new_admin_contest_path
      fill_in 'contest_name', with: "10k sweepstakes"
      fill_in 'contest_slug', with: 'SLUG'
      fill_in 'contest_location', with: 'Franklin, TN'
      fill_in 'contest_starts_at', with: '01/01/2015'
      fill_in 'contest_ends_at', with: '30/12/2015'

      expect { click_button 'Save' }.to change { Contest.count }.by 1
      Contest.order('created_at ASC').last.tap do |contest|
        expect(page).to have_content contest.name
        expect(contest.name).to eq "10k sweepstakes"
        expect(page.current_path).to eq admin_contests_path
      end
    end

    it 'updates any contest' do
      contest = Contest.main
      visit admin_contests_path
      click_link 'Edit', match: :first
      expect(page).to have_content 'Edit Contest'
      fill_in 'contest_name', with: '$9999 green idea sweepstakes'
      click_button 'Save'
      expect(page.current_path).to eq admin_contests_path
      expect(page).to have_content '$9999 green idea sweepstakes'
    end

    it 'destroys a contest', js: true do
      expected_count = Contest.count - 1
      visit admin_contests_path
      page.accept_confirm do
        click_link 'Delete', match: :first
      end
      expect(page.current_path).to eq admin_contests_path
      expect(Contest.count).to eq expected_count
    end
  end

end
