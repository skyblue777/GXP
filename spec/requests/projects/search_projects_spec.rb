describe 'Searching for projects', pg: true, js: true do

  it 'searches projects when hitting enter' do
    visit projects_path
    fill_in 'query', with: "Carpooling\n"
    expect(page).to have_selector '.project-block', count: 1
    expect(page).to have_content 'Carpooling to Work'
  end

  it 'searches projects when clicking the icon' do
    visit projects_path
    fill_in 'query', with: 'Carpooling'
    find('#search-icon').click
    expect(page).to have_selector '.project-block', count: 1
    expect(page).to have_content 'Carpooling to Work'
  end

  it 'a blank query shows all projects' do
    visit projects_path
    fill_in 'query', with: "Carpooling\n"
    expect(page).to have_selector '.project-block', count: 1
    fill_in 'query', with: "\n"
    expect(page).to have_selector '.project-block', count: 2
  end

end
