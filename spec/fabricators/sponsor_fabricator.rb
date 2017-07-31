Fabricator(:sponsor) do
  name { Faker::Company.name }
  email { Faker::Internet.email }
  phone { Faker::PhoneNumber.phone_number }
  address_1 { Faker::Address.street_address }
  address_2 { Faker::Address.secondary_address }
  city { Faker::Address.city }
  state { Faker::Address.state }
  country { Faker::Address.country }
  zip { Faker::Address.zip }
  duration { 'one year' }
  start_date { Date.tomorrow }
  region { 'Canada' }
  notes { 'Please call.' }
end
