describe 'Viewing contest winners' do
  login { admins(:admin) }

  it 'has a link to the contest winners when viewing contests' do
    visit admin_contests_path
    expect(page).to have_link 'View winners', admin_contest_winners_path(contests(:tenK))
    expect(page).to have_link 'View winners', admin_contest_winners_path(contests(:franklin))
    expect(page).to have_link 'View winners', admin_contest_winners_path(contests(:portland))
  end

  it 'sorts the winners by vote count' do
    users(:logan).votes.create! project: projects(:beehives)
    expect {
      users(:danny).votes.create! project: projects(:carpooling)
      users(:karla).votes.create! project: projects(:carpooling)
    }.to change {
      visit admin_contest_winners_path(contests(:tenK))
      first('td').native.text
    }.from('Bee hives').to 'Carpooling to Work'
  end
end
