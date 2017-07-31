describe Address do
  let!(:address) { Fabricate :address }
  
  it { is_expected.to have_one :order_shipping }
  it { is_expected.to have_one :order_billing }

  %w(name street city state zip).each do |field|
    it { is_expected.to validate_presence_of field }
  end
end
