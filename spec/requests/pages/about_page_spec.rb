describe 'About page' do

  it 'is on the nav bar' do
    visit root_path
    click_link 'About'
    expect(page.current_path).to eq about_path
  end

  it 'has a link to buy the book' do
    visit about_path
    expect(page).to have_link 'Buy the book', href: products_path
  end

  it 'renders the video' do
    visit about_path
    expect(page).to have_selector 'video[poster*="about-video-poster.jpg"]'
    expect(page).to have_selector 'source[src*="Explainer+Video.mp4"]'
  end

end
