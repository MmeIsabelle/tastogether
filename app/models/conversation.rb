class Conversation
  attr_reader :main_user, :other_user
  
  def initialize(attrs={})
    @main_user = attrs[:main_user]
    @other_user = attrs[:other_user]
  end

  def messages
    Message.between(main_user, other_user)
  end
end