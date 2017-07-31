class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.finalized
    end
  end

  def new?
    @user && @user.redemption_code.present?
  end

  def show?
    record.finalized? or record.users.include?(user)
  end

  def step2?
    admin?
  end

  def update?
    admin?
  end

  def finalize?
    admin?
  end

  private
    def admin?
      record.users.admin.include? user
    end
end
