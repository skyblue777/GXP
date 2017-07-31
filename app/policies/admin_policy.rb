class AdminPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.super_admin?
        scope.all.order(role: :desc)
      else
        scope.where.not(role: scope.roles[:super_admin]).order(role: :desc)
      end
    end
  end

  def create?
    super_admin?
  end

  def update?
    super_admin? or self?
  end

  def destroy?
    super_admin? and !self?
  end

  def edit_roles?
    super_admin?
  end

  def roles
    _roles = Admin.roles
    _roles = _roles.except('super_admin') unless super_admin?
    _roles.map do |name, value|
      [name.titleize, name]
    end
  end

  private

    def self?
      user == record
    end

    def super_admin?
      user.super_admin?
    end

end
