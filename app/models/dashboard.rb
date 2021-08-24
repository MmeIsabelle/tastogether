class Dashboard
attr_reader :user
  
  def initialize(user)
    @user = user
  end

  def pending_participations
    user.participations.pending
  end
end