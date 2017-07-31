Fabricator(:product) do
  name { sequence(:name) { |i| "#{Faker::Color.color_name}#{i}" } }
  price { Faker::Number.decimal(2) }
  description { Faker::Lorem.sentence }
  image_id { 1 }
  image_filename { 'test.png' }
  image_size { 500 }
  image_content_type { 'image/png' }
end
