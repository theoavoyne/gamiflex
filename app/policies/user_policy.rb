class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def suggest?
    user.suggestion @@ user.states.where(state: "like").length > 5
  end

  def choose_games?
    user.states.where(state: "like").length < 5
  end
end
