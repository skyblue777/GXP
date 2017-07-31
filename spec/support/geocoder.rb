RSpec.configure do |config|
  config.before(:all) do 
    Geocoder.configure(:lookup => :test)

    Geocoder::Lookup::Test.set_default_stub(
      [
        {
          'latitude'     => 35.981542,
          'longitude'    => -86.74781999999999,
          'address'      => 'Franklin, TN, USA',
          'state'        => 'Tennessee',
          'state_code'   => 'TN',
          'country'      => 'United States',
          'country_code' => 'US'
        }
      ]
    )
  end
end
