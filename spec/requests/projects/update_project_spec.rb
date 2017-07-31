describe 'Update an existing project' do
  let(:user) { users(:logan) }
  let(:project) { projects(:carpooling) }
  login { user }

  it 'updates the project attributes' do
    project.images.first.update! image: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png'))
    visit edit_project_path(project)
    fill_in 'project_name', with: 'Carpooling 123'
    fill_in 'project_body', with: 'Description 123'
    click_button 'Next'
    expect(page).to have_content 'About you'
    project.reload
    expect(project.name).to eq 'Carpooling 123'
    expect(project.body).to eq 'Description 123'
  end

  it 'updates the project image' do
    project.images.first.update! image: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png'))
    image_before = project.images.first.id
    visit edit_project_path(project)
    attach_file 'project_images_attributes_0_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo-2.png')
    click_button 'Next'
    expect(page).to have_content 'About you'
    expect(project.reload.images.last.id).to_not eq image_before
  end
end
