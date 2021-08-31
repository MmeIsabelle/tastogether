class MessagesController < ApplicationController
  def create
    @conversations = policy_scope(Conversation)
    sender = current_user
    recipient = User.find(params[:conversation_other_user_id])
    @current_conversation = current_conversation
  
    @message = Message.new(message_params)
    @message.sender = sender
    @message.recipient = recipient
    if @message.save
      create_notification
      broadcast_notification
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

  def broadcast_notification
    NotificationChannel.broadcast_to(
      @message.recipient,
      template: render_notification,
      notification_count: @message.recipient.pending_messages_count
    )
  end
  
  def render_notification
    render_to_string(partial: 'notifications/messages/received', locals: {message: @message})
  end

  def create_notification
    Notification.create(
      user: @message.recipient, 
      text: render_notification
    )
  end
end
