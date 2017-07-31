shared_context 'geolocate' do

  before do
    allow_any_instance_of(ActionDispatch::Request).to receive(:location) do 
      instance_double("Geocoder::Result::Freegeoip", city: 'Franklin', state: 'Tennessee', country: 'USA', latitude: 35.981542, longitude: -86.74781999999999) 
    end
  end

end

def geolocate
  include_context 'geolocate'
end