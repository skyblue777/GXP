Fabricator(:admin) do
  name { Faker::Name.name }
  email { Faker::Internet.email }
  password { 'password' }
  role { 1 }
end
