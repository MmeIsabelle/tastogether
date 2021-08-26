class ParticipationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    # if user is not the host and if user is not already among participants then grant authorization
    !(record.tasting.host_participation == user || record.tasting.participations.where(user: user).exists?)
  end

  def update?
    record.tasting.host == user
  end
end
