class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :project, required: true, touch: true, counter_cache: true
  has_one :contest, through: :project

  validate :cannot_vote_for_yourself
  validate :cannot_vote_multiple_times_in_one_contest

  private

    def cannot_vote_multiple_times_in_one_contest
      errors.add :base, :too_many_votes if user.voted_in_contest? contest
    end

    def cannot_vote_for_yourself
      errors.add :base, :cannot_vote_for_yourself if project.users.include? user
    end

end
