Fabricator(:contest) do
  name { Faker::Color.color_name }
  starts_at { Date.today - 1 }
  ends_at { Date.today + 1 }
  slug { sequence(:slug) { |i| "#{Faker::Internet.slug(Faker::Company.name, '-')}#{i}" } }
  main { true }
end
