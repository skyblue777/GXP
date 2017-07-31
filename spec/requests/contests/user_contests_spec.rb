describe 'User views contest' do
  let(:user) { users(:danny) }
  login { user }
  geolocate

  it 'only sees localed contests' do
    pending
    raise 'might revisit this later, for now just using direct links instead of a contest browser'
    visit contests_path
    contest_count = Contest.count
    expect(contest_count).to eq 3
    expect(page).to have_selector('.contest-li', count: contest_count-1)
  end
end
