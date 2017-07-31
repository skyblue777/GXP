describe Project do
  let!(:image) { Fabricate :image }
  let!(:project) { Fabricate :project, images: [image] }

  it { is_expected.to belong_to(:contest) }
  it { is_expected.to have_one(:group) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:child_comments).class_name('Comment') }
  it { is_expected.to have_many(:votes) }
  it { is_expected.to have_many(:project_categories) }
  it { is_expected.to have_many(:categories).through(:project_categories) }
  it { is_expected.to have_many(:project_users) }
  it { is_expected.to have_many(:users).through(:project_users) }
  it { is_expected.to have_many(:images) }
  it { is_expected.to have_many(:administrators) }
  it { is_expected.to validate_length_of(:categories) }
  it { is_expected.to validate_length_of(:tagline) }

  %w(name body).each do |field|
    it { is_expected.to validate_presence_of field }
  end

  it "allows attaching a video" do
    project1 = Project.new

    project1.video = Refile::FileDouble.new("dummy", "text.mp4", content_type: "video/mp4")
    project1.save

    expect(project1.video).not_to be_nil
  end

  it "doesn't allow attaching other files" do
    project1 = Project.new

    project1.video = Refile::FileDouble.new("dummy", "file.txt", content_type: "text/plain")
    project1.save

    expect(project1.video).to be_nil
  end
end
