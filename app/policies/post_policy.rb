class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.none unless user

      if user.moderator? or user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def index?
    true
  end

  def show?
    super && (record_owned_by_user? || user_is?('moderator', 'admin'))
  end

  def destroy?
    user_exists? && (record_owned_by_user? || user_is?('admin', 'moderator'))
  end
end