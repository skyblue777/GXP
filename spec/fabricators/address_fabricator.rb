Fabricator(:address) do
  street { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state_abbr }
  zip { Faker::Address.zip_code }
  country { 'US' }
  name { Faker::Name.name }
end
