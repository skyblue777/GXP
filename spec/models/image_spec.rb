describe Image do
  let!(:image) { Fabricate :image }
  
  it { is_expected.to validate_presence_of(:image_filename) }

  it 'allows attaching an image' do
    image = Image.new

    image.image = Refile::FileDouble.new("dummy", "logo.png", content_type: "image/png")
    image.save

    expect(image.image).to be_present
  end

  it "doesn't allow attaching other files" do
    image = Image.new

    image.image = Refile::FileDouble.new("dummy", "file.txt", content_type: "text/plain")
    image.save

    expect(image.image).to be_nil
  end
end
