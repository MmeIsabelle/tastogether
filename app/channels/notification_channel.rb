class NotificationChannel < ApplicationCable::Channel
  def subscribed
    current_user = User.find(params[:id])
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
