class User < ActiveRecord::Base
  has_many :votes
  has_many :project_users
  has_many :orders
  has_many :projects, through: :project_users
  has_many :projects_voted_for, through: :votes, source: :project
  has_many :contests, through: :projects
  has_many :contests_voted_in, -> { uniq }, through: :votes, source: :contest

  has_many :subscriptions
  has_many :payments
  has_many :send_requests

  devise :database_authenticatable, :registerable, :timeoutable, :recoverable,
         :rememberable, :trackable, :validatable, :async, :token_authenticatable

  attachment :image, extension: %w(jpg jpeg png gif)

  geocoded_by :location
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city    = geo.city
      obj.state   = geo.state_code
      obj.country = geo.country_code
    end
  end
  after_validation :geocode, :reverse_geocode

  validate :current_password, :on => :update
  validates :name, :location, presence: true
  validates :bio, length: { maximum: 450 }
  # validates_with RedemptionCodeValidator, on: [:create, :update]
  validates :terms_of_service, acceptance: true

  def to_s
    name
  end

  def self.admin
    joins(:project_users).merge ProjectUser.admin
  end

  def voted_for?(project)
    projects_voted_for.include? project
  end

  def voted_in_contest?(contest)
    contests_voted_in.include? contest
  end

  def votes_in_contest(contest)
    votes.joins(:contest).where(contests: { id: contest.id })
  end

  def project_voted_for_in_contest(contest)
    projects_voted_for.find_by contest: contest
  end

  def active
    redemption_code.present? || subscriptions.any?{ |subscription| subscription.active? }
  end
end
