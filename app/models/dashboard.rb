class Dashboard
attr_reader :user
  
  def initialize(user)
    @user = user
  end

  def hostings
    user.hosted_tastings
  end

  def pending_participations
    user.participations.pending.where(host: false)
  end

  def upcoming_tastings
    user.participations.accepted.where(host: false)
  end

  def finished_tastings
    user.participations.finished.where(host: false)
  end
end