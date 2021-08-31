class MessagesController < ApplicationController
  def create
    @conversations = policy_scope(Conversation)
    @sender = current_user
    @recipient = User.find(params[:conversation_other_user_id])
    @current_conversation = current_conversation
  
    @message = Message.new(message_params)
    @message.sender = @sender
    @message.recipient = @recipient
    if @message.save
      redirect_to conversations_path(anchor: "message-#{@message.id}")
    else
      render 'conversations/index'
    end
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def current_conversation
    Conversation.new(
      main_user: current_user,
      other_user: User.find(params[:conversation_other_user_id])
    )
  end
end
