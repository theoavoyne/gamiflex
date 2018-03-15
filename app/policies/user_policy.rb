class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def suggest?
    user.states.length >= 5
  end

  def choose_games?
    user.states.length < 5
  end
end
