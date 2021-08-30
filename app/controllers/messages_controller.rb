class MessagesController < ApplicationController
  def create
    @sender = current_user
    @recipient = current_conversation.other_user.username
    @message = Message.new(message_params)
    if @message.save
      redirect_to conversations_path
    else
      #TODO
    end
  end

  private

  def message_params
    require.params(:message).permit(:content)
  end
end
