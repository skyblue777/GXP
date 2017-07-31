describe 'Home page functionality' do

  it 'has a link to see projects' do
    visit root_path
    expect(page).to have_link 'Projects', href: projects_path
  end
  #
  it 'has a link to buy the book' do
    visit root_path
    expect(page).to have_link 'Buy the book', href: products_path
  end

  it 'renders the video' do
    visit root_path
    expect(page).to have_selector 'video[poster*="promo-preview.jpg"]'
    expect(page).to have_selector 'source[src*="green-x-promo.mp4"]'
  end
end
