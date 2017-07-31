Fabricator(:user) do
  name { Faker::Name.name }
  email { Faker::Internet.email }
  password { 'password' }
  redemption_code { (RedemptionCode.create).code }
  location { Faker::Address.zip }
end
