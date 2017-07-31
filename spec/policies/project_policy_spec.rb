describe ProjectPolicy do
  subject { described_class }
  let(:user) { users(:logan) }

  permissions :new? do
    it 'denies access if redemption_code is missing' do
      user.update redemption_code: nil
      expect(subject).not_to permit(user)
    end

    it 'grants access if redemption_code is present' do
      expect(user.redemption_code).to be_present
      expect(subject).to permit(user)
    end
  end
end
