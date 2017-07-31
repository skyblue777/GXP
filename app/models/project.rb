class Project < ActiveRecord::Base
  MAX_VIDEO_SIZE = 20.megabytes
  MIN_PROJECT_IMAGES = 1
  MAX_PROJECT_IMAGES = 4
  has_attached_file :audio
  validates_attachment_content_type :audio, :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ],
                                    :message => 'file must be of filetype .mp3'
  validates_attachment_size :audio, :less_than => 10.megabytes
  after_commit :transcode_video

  belongs_to :contest, required: true
  has_one :group
  has_many :comments, dependent: :destroy
  has_many :child_comments, as: :commentable, class_name: 'Comment', dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :project_categories, dependent: :destroy
  has_many :categories, through: :project_categories
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
  has_many :images
  has_many :administrators, -> { where(admin: true) }, class_name: 'ProjectUser' do
    def <<(user)
      proxy_association.owner.project_users << ProjectUser.new(admin: true, user: user)
    end
  end

  # accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |att| (att[:image].blank? || att[:image] == "{}") && att[:description].blank? }
  # accepts_nested_attributes_for :images, allow_destroy: true
  # accepts_attachments_for :images

  attachment :video, background: true, extension: %w(mov mpeg mpg avi mp4 3gp wmv flv mp4)
  attachment :video_mp4, extension: 'mp4'
  attachment :video_webm, extension: 'webm'

  validates :name, :body, presence: true
  validates :categories, presence: true
  validates :tagline, length: { maximum: 140 }
  # validate  :correct_number_of_images
  validate  :cannot_attach_files_that_are_too_large
  validate  :cannot_enter_same_contest_twice
  validate  :cannot_enter_contest_before_it_starts, on: :create
  # validate  :cannot_enter_contest_after_it_ends, on: :create

  def to_s
    name
  end

  def user
    users.first if !group?
  end

  def group?
    group.present?
  end

  def has_video?
    video_id.present? or video_mp4.present? or video_webm.present?
  end

  def processing_video?
    video_id.present? and (video_mp4.nil? or video_webm.nil?)
  end

  def self.by_time_of_vote
    order('votes.created_at DESC')
  end

  def self.finalized
    where finalized: true
  end

  def first_image_url(size)
    images.exists? ? images.first.image.url(size) : "/images/#{size}/missing.png"
  end

  private

    def transcode_video
      TranscodeVideoWorker.perform_later(self, 'video')
    end

    def correct_number_of_images
      errors.add :images, (I18n.t 'activerecord.errors.models.project.attributes.images.too_many', count: MAX_PROJECT_IMAGES) if images.length > MAX_PROJECT_IMAGES
      errors.add :images, (I18n.t 'activerecord.errors.models.project.attributes.images.not_enough', count: MIN_PROJECT_IMAGES) if images.length < MIN_PROJECT_IMAGES
    end

    def cannot_enter_same_contest_twice
      project_users.each do |pu|
        if pu.user.projects.any? { |project| project.contest == contest && project.id != nil && project.id != id }
          errors.add :contest, :taken if pu.user.contests.include? contest
        end
      end
    end

    def cannot_attach_files_that_are_too_large
      errors.add :video, (I18n.t 'activerecord.errors.models.project.attributes.videos.too_large') if (video_size && video_size > MAX_VIDEO_SIZE)
    end


    def cannot_enter_contest_before_it_starts
      errors.add :contest, :too_early if contest.try(:starts_at).try(:future?)
    end

    def cannot_enter_contest_after_it_ends
      errors.add :contest, :too_late if contest.try(:ends_at).try(:past?)
    end

end
