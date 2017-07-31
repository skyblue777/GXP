Fabricator(:order) do
  name { Faker::Color.color_name }
  permalink { SecureRandom.hex(5).to_s }
  shipped { 'shipped' }
  price { Faker::Number.decimal(2) }
  complete { false }
  billing_address { Fabricate(:address) }
  shipping_address { Fabricate(:address) }
  token { '123' }
  email { 'a@b.com' }
  tax { 0.00 }
  subtotal { 0.00 }
  shipping { 0.00 }
end
