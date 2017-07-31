class GroupInvitationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def destroy?
    record.project.users.admin.include? user
  end
end
