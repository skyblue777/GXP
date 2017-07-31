Fabricator(:order_product) do
  order
  product
  quantity { Faker::Number.between(1, 10) }
  name { sequence(:name) { |i| "#{Faker::Color.color_name}#{i}" } }
  price { Faker::Number.decimal(2) }
  description { Faker::Lorem.sentence }
  digital { true }
end
