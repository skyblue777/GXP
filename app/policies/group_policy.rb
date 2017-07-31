class GroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    record.project.users.include? user
  end

  def update?
    record.project.users.include? user
  end

end
