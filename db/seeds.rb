Rake::Task['db:fixtures:load'].invoke if Rails.env.development?

BookType.create!(name: "Hardcover", created_at: "2017-01-01 00:00:00", updated_at: "2017-01-01 00:00:00")
BookType.create!(name: "Paperback", created_at: "2017-01-01 00:00:00", updated_at: "2017-01-01 00:00:00")
BookType.create!(name: "Audio", created_at: "2017-01-01 00:00:00", updated_at: "2017-01-01 00:00:00")
BookType.create!(name: "Ebook", created_at: "2017-01-01 00:00:00", updated_at: "2017-01-01 00:00:00")

# BookVersion.create(version_name: "Colored", created_at: "2017-01-01 00:00:00", updated_at: "2017-01-01 00:00:00")
# BookVersion.create(version_name: "Black and White", created_at: "2017-01-01 00:00:00", updated_at: "2017-01-01 00:00:00")

contest = Contest.first || Contest.create(name: '10K Sweepstakes', starts_at: 1.year.ago, ends_at: 1.year.from_now, slug: '10k')
contest.update main: true if Contest.where(main: true).size.zero?

categories = (Category.count > 0) ? [] : %w(Recreation)
categories.each do |category|
  Category.find_or_create_by(name: category)
end

Admin.create name: 'Thomas', email: 'taddaquay@gmail.com', password: 'mirMRK2vLfNMX8jT', role: 1
