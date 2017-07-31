describe Comment do
  let!(:comment) { Fabricate :comment }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:project) }
  it { is_expected.to belong_to(:commentable) }
  it { is_expected.to have_many(:comments) }

  it { is_expected.to validate_length_of(:body) }
  it { is_expected.to validate_presence_of(:body) }
end
