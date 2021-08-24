class Dashboard
attr_reader :user
  
  def initialize(user)
    @user = user
  end

  def pending_tastings
    @pendings = Participation.where(user_id: @user, status: "pending")
  end
end