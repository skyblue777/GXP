Fabricator(:comment) do
  body { Faker::Lorem.sentence }
  project
  commentable { |attrs| attrs[:project] }
  user
end
