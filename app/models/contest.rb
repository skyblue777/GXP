class Contest < ActiveRecord::Base
  has_many :projects, dependent: :destroy
  has_many :users, through: :projects

  geocoded_by :location
  after_validation :geocode, if: ->(obj) { obj.location.present? && obj.location_changed? }

  validates :name, :starts_at, :ends_at, presence: true
  validates :slug, presence: true, uniqueness: true

  after_save :ensure_one_main_contest, if: :main?

  def self.near_US(location)
    self.where(location: nil) + self.near(location)
  end

  def self.main
    find_by(main: true) || take
  end

  def self.current
    where 'starts_at <= :now AND ends_at >= :now', now: Time.current
  end

  def to_param
    slug
  end

  def to_s
    name
  end

  private

    def ensure_one_main_contest
      Contest.where(main: true).find_each do |contest|
        contest.update main: false if contest != self
      end
    end

end
