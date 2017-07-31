describe User do
  let!(:user) { Fabricate :user }

  it { is_expected.to have_many :votes }
  it { is_expected.to have_many :project_users }
  it { is_expected.to have_many(:projects).through(:project_users) }
  it { is_expected.to have_many(:projects_voted_for).through(:votes) }
  it { is_expected.to have_many(:contests).through(:projects) }
  it { is_expected.to have_many(:contests_voted_in).through(:votes) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:bio).is_at_most(450) }
  it { is_expected.to validate_presence_of(:location) }

  describe '.admin' do
    it 'returns all users that are admin for a project' do
      expect(User.admin).to_not include users(:karla)
      expect(User.admin).to include users(:logan)
    end
  end

  describe '#to_s' do
    it 'returns the user\'s name' do
      expect(user.to_s).to eq user.name
    end
  end

  describe 'geocoding' do
    it 'sets the latitude and longitude from the location' do
      expect(user.latitude).to be_present
    end
  end

  describe '#active' do
    context 'when there is no subscription or redemption_code' do
      before do
        user.update redemption_code: nil
      end

      it 'is not active' do
        expect(user.active).to be_falsy
      end
    end

    context 'when there is a subscription' do
      it 'is active' do
        # subscription = instance_double("Payola::Subscription", active?: true)
        # allow(user).to receive(:payola_subscription).and_return(subscription)
        # expect(user.active).to be_truthy
      end
    end

    context 'when there is a redemption_code' do
      it 'is active' do
        expect(user.active).to be_truthy
      end
    end
  end
end
