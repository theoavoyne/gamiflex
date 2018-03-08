class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def suggest?
    user.suggestion
  end
end
