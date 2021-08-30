class MessagesController < ApplicationController
  def create
    @sender = current_user
    @recipient = User.find(params[:conversation_other_user_id])
    @message = Message.new(message_params)
    @message.sender = @sender
    @message.recipient = @recipient
    if @message.save
      redirect_to conversations_path(anchor: "message-#{@message.id}")
    else
      render conversations_path
    end
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
