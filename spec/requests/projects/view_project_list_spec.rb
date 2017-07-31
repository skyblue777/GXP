describe 'Project index page' do

  before do
    21.times do |n|
      p = Project.new name: "Test #{n}", body: 'Test'
      p.contest = contests(:tenK)
      p.finalized = true
      p.administrators << users(:logan)
      p.save(validate: false)
    end
  end

  it 'shows 20 projects by default and loads more content as the user scrolls', js: true do
    pending
    visit projects_path
    expect(page).to have_css('.project-block', count: 12)
    click_link 'Load More'
    expect(page).to have_css('.project-block', count: 24)
  end

  it 'is sorted by votes count' do
    projects(:beehives).votes.create user: users(:logan)
    visit projects_path
    expect(all('.project-block')[0][:id]).to eq "project#{projects(:beehives).id}"
  end

  it 'filters by category', js: true do
    visit projects_path
    page.should have_css '.project-block', count: 12
    first('.category-filter div.selectize-input').click
    find('div.option', text: 'Recreation').click
    page.should have_css '.project-block', count: 2
  end

  it 'filters by contest (in URL)' do
    visit contest_path(contests(:tenK).slug)
    expect(page).to have_css('.project-block', count: 12)
    visit contest_path(contests(:franklin).slug)
    expect(page).to have_css('.project-block', count: 2)
    expect(page).to have_content 'Save the whales'
    expect(page).to have_content 'Wind power'
  end

  it 'filters by contest and category', js: true do
    projects(:recycling).categories << categories(:power)

    visit contest_path(contests(:franklin).slug)
    expect(page).to have_css('.project-block', count: 2)

    first('.category-filter div.selectize-input').click
    find('div.option', text: 'Power').click
    expect(page).to have_no_content 'Save the whales'
    expect(page).to have_content 'Wind power'
    expect(page).to have_link 'More', href: project_path(projects(:wind_power))
    expect(page).to have_css('.project-block', count: 1)
  end

  it 'has a list of all current contests in a filter' do
    visit projects_path
    expect(page).to have_select 'contest-filter', options: [ '$10k green idea sweepstakes', '$9999 sweepstakes', '$5000 sweepstakes' ]
    contests(:tenK).update starts_at: 5.minutes.from_now
    visit projects_path
    expect(page).to have_select 'contest-filter', options: [ '$9999 sweepstakes', '$5000 sweepstakes' ]
  end

  it 'links to the contest page when a contest is selected from the dropdown', js: true do
    visit projects_path
    selectize '.contest-filter', contests(:portland).name
    expect(page.current_path).to eq contest_projects_path(contests(:portland))
  end

end
