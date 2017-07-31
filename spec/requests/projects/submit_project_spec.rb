describe 'Project submission' do
  let(:user) { users(:logan) }
  login { user }

  before { user.projects.destroy_all }

  it 'submits a new project (step 1)' do
    user.projects.destroy_all
    visit new_project_path
    fill_in 'project_name', with: 'Test'
    fill_in 'project_body', with: 'Test'
    attach_file 'project_images_attributes_0_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
    select '$10k green idea sweepstakes', from: 'project_contest_id'
    select 'Recreation', from: 'project_category_ids'
    click_button 'Next'
    Project.last.tap do |project|
      expect(project.users).to include user
      expect(project.project_users.first).to be_admin
      expect(project.name).to eq 'Test'
      expect(project.body).to eq 'Test'
      expect(page.current_path).to eq step2_project_path(project)
    end
  end

  it 'autoselects the contest' do
    visit root_path
    click_link 'Start your Project'
    expect(page).to have_select 'project_contest_id', selected: contests(:tenK).name
  end

  context 'step 2' do
    before do # step 1
      visit new_project_path
      fill_in 'project_name', with: 'Test'
      fill_in 'project_body', with: 'Test'
      attach_file 'project_images_attributes_0_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
      select '$10k green idea sweepstakes', from: 'project_contest_id'
      select 'Recreation', from: 'project_category_ids'
      click_button 'Next'
    end

    it 'allows the user to pick if they are alone or a group' do
      expect(page).to have_content 'Just Me'
      expect(page).to have_content 'Group or Organization'
    end

    it 'updates the user profile if they are alone' do
      click_link 'Just Me'
      fill_in 'user_name', with: 'Updated name'
      click_button 'Next', match: :first
      expect(page).to have_content 'Almost Done'
      expect(user.reload.name).to eq 'Updated name'
    end

    it 'shows validation errors on the user profile if they are alone' do
      click_link 'Just Me'
      fill_in 'user_name', with: ''
      click_button 'Next', match: :first
      expect(page).to have_content "can't be blank"
    end

    it 'allows the user to go back to the basics page while editing their profile' do
      project = Project.last
      expect(project.name).to eq 'Test'
      click_link 'Basics'
      fill_in 'project_name', with: 'Test 2'
      click_button 'Next'
      expect(page).to have_link 'Just Me'
      expect(project.reload.name).to eq 'Test 2'
    end

    it 'creates a new group if they are choosing a group' do
      project = Project.last
      click_link 'Group or Organization'
      fill_in 'group_name', with: 'Metova'
      fill_in 'group_bio', with: 'Bio'
      within '.new_group' do
        click_button 'Next'
      end
      expect(page).to have_content 'Almost Done'
      expect(project.reload.group).to be_present
      expect(project.reload.group.name).to eq 'Metova'
      expect(project.reload.group.bio).to eq 'Bio'
    end

    it 'shows validation errors on the group form if they are a group' do
      click_link 'Group or Organization'
      within '.new_group' do
        click_button 'Next'
      end
      expect(page).to have_content "can't be blank"
    end
  end

  context 'step 3' do
    it 'requires an admin to approve a submission' do
      project = projects(:carpooling)
      project.administrators << user
      project.images.first.update! image: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png'))
      project.update! finalized: false
      visit project_path(project)
      click_link 'Looks good - submit!'
      expect(page).to have_content 'Carpooling to Work'
      expect(project.reload).to be_finalized
    end

    it 'fails when a non-admin tries to approve a submission' do
      project = projects(:carpooling)
      project.users << user
      project.images.first.update! image: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png'))
      project.update! finalized: false
      visit project_path(project)
      click_link 'Looks good - submit!'
      expect(project.reload).to_not be_finalized
    end
  end

  it 'shows an error when trying to join the same contest twice' do
    2.times do
      visit new_project_path
      fill_in 'project_name', with: 'Test'
      fill_in 'project_body', with: 'Test'
      attach_file 'project_images_attributes_0_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
      select '$10k green idea sweepstakes', from: 'project_contest_id'
      select 'Recreation', from: 'project_category_ids'
      click_button 'Next'
    end
    expect(page).to have_content 'has already received a project submission from you'
    expect(find('.simple_form')['class']).to eq 'simple_form new_project'
  end

  it 'shows an error when not selecting a category' do
    visit new_project_path
    fill_in 'project_name', with: 'Test'
    fill_in 'project_body', with: 'Test'
    attach_file 'project_images_attributes_0_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
    select '$10k green idea sweepstakes', from: 'project_contest_id'
    click_button 'Next'
    expect(page).to have_content 'must have at least one chosen'
  end

  it 'shows an error if submitting the project too early' do
    contest = Contest.main
    contest.update starts_at: 5.minutes.from_now
    visit new_project_path
    click_button 'Next'
    expect(page).to have_content 'has not started yet!'
    expect(page.current_path).to eq projects_path
  end

  it 'shows an error if submitting the project too late' do
    contest = Contest.main
    contest.update ends_at: 5.minutes.ago
    visit new_project_path
    click_button 'Next'
    expect(page).to have_content 'has already ended!'
  end

  it 'shows an error if there are not enough images' do
    visit new_project_path
    click_button 'Next'
    expect(page).to have_content 'must have at least'
  end

  it 'attaches a video' do
    visit new_project_path
    fill_in 'project_name', with: 'Test'
    fill_in 'project_body', with: 'Test'
    attach_file 'project_images_attributes_0_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
    select '$10k green idea sweepstakes', from: 'project_contest_id'
    select 'Recreation', from: 'project_category_ids'
    attach_file 'project_video', Rails.root.join('spec', 'fixtures', 'files', 'test-video.mov')
    click_button 'Next'
    click_link 'Just Me'
    click_button 'Next', match: :first
    expect(page).to have_content "We are currently processing this project's video"
    jobs = enqueued_jobs.select { |job| job[:job] == TranscodeVideoWorker }
    expect(jobs.size).to eq 1
    expect(jobs[0][:args][0].class).to eq Project
    expect(jobs[0][:args][1]).to eq 'video'
  end

  it 'shows an error if the video is too large' do
    stub_const("Project::MAX_VIDEO_SIZE", 50.kilobytes)
    visit new_project_path
    fill_in 'project_name', with: 'Test'
    fill_in 'project_body', with: 'Test'
    attach_file 'project_images_attributes_0_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
    select '$10k green idea sweepstakes', from: 'project_contest_id'
    select 'Recreation', from: 'project_category_ids'
    attach_file 'project_video', Rails.root.join('spec', 'fixtures', 'files', 'test-video.mov')
    click_button 'Next'
    expect(page).to have_content 'is too large'
  end

  it 'shows an error if an image is too large' do
    stub_const("Image::MAX_IMAGE_SIZE", 50.kilobytes)
    visit new_project_path
    fill_in 'project_name', with: 'Test'
    fill_in 'project_body', with: 'Test'
    attach_file 'project_images_attributes_0_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
    select '$10k green idea sweepstakes', from: 'project_contest_id'
    select 'Recreation', from: 'project_category_ids'
    attach_file 'project_video', Rails.root.join('spec', 'fixtures', 'files', 'test-video.mov')
    click_button 'Next'
    expect(page).to have_content 'is too large'
  end

  it 'keeps the uploaded video on the form after validation errors' do
    visit new_project_path
    fill_in 'project_name', with: 'Test'
    fill_in 'project_body', with: 'Test'
    attach_file 'project_images_attributes_0_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
    attach_file 'project_video', Rails.root.join('spec', 'fixtures', 'files', 'test-video.mov')
    click_button 'Next'
    metadata = JSON.parse first("input[name='project[video]']")['value']
    expect(metadata['filename']).to eq 'test-video.mov'
  end

  it 'enqueues a crop worker when the user crops the image' do
    visit new_project_path
    fill_in 'project_name', with: 'Test'
    fill_in 'project_body', with: 'Test'
    select 'Recreation', from: 'project_category_ids'
    select '$10k green idea sweepstakes', from: 'project_contest_id'
    attach_file 'project_images_attributes_0_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
    first('#image_crop_x', visible: false).set(5)
    first('#image_crop_y', visible: false).set(6)
    first('#image_crop_w', visible: false).set(7)
    first('#image_crop_h', visible: false).set(8)
    click_button 'Next'
    expect(enqueued_jobs).to include hash_including(job: CropImageWorker)
  end

  it 'enqueues a crop worker when the user crops the image' do
    visit new_project_path
    fill_in 'project_name', with: 'Test'
    fill_in 'project_body', with: 'Test'
    select 'Recreation', from: 'project_category_ids'
    select '$10k green idea sweepstakes', from: 'project_contest_id'
    attach_file 'project_images_attributes_0_image', Rails.root.join('spec', 'fixtures', 'files', 'test-photo.png')
    first('#image_crop_x', visible: false).set(5)
    first('#image_crop_y', visible: false).set(6)
    first('#image_crop_w', visible: false).set(7)
    first('#image_crop_h', visible: false).set(8)
    perform_enqueued_jobs do
      click_button 'Next'
      expect(page).to have_content 'Just Me'
      image = MiniMagick::Image.new Project.last.images.first.image_attacher.get.to_io.path
      expect(image[:width]).to eq 7
      expect(image[:height]).to eq 8
    end
  end
end
