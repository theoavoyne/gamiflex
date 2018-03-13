class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def search?
    true
  end
end
