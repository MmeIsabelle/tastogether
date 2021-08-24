class ParticipationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    # if user is not the host and if user is not already among participants
    record.tasting.user != user && record.tasting.participations.where(user: user).none?
  end
end
