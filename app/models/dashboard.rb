class Dashboard
attr_reader :user
  
  def initialize(user)
    @user = user
  end

  def hostings
    user.hosted_tastings
  end

  def pending_participations
    user.participations.pending
  end

  def upcoming_tastings
    user.participations.accepted
  end

  def finished_tastings
    user.participations.finished
  end
end