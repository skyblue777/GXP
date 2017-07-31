describe Product do
  let!(:product) { Fabricate :product }

  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { is_expected.to validate_numericality_of(:price) }
  it { is_expected.to validate_presence_of(:image_filename) }

  it 'allows attaching an image' do
    product = Product.new

    product.image = Refile::FileDouble.new("dummy", "logo.png", content_type: "image/png")
    product.save

    expect(product.image).to be_present
  end

  it "doesn't allow attaching other files" do
    product = Product.new

    product.image = Refile::FileDouble.new("dummy", "file.txt", content_type: "text/plain")
    product.save

    expect(product.image).to be_nil
  end
end
