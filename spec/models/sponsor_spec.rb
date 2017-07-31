describe Sponsor do
  let!(:sponsor) { Fabricate :sponsor }

  %w(name phone email).each do |field|
    it { is_expected.to validate_presence_of field }
  end
end
