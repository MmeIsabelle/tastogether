class ConversationsController < ApplicationController
  def index
    current_user.notifications.pending.update(viewed: true)
    @conversations = policy_scope(Conversation)
    @current_conversation = current_conversation
    @message = Message.new
  end

  private

  def current_conversation
    Conversation.new(
      main_user: current_user, 
      other_user: current_correspondent
    )
  end
  
  def current_correspondent
    User.find_by_id(params[:user_id]) || current_user.last_correspondent if current_user.messages
  end
end
