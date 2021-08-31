class ParticipationsController < ApplicationController
  def create
    @tasting = Tasting.find(params[:tasting_id])
    @participation = Participation.new(participation_params)
    @participation.tasting = @tasting
    @participation.user = current_user

    # set the host attribute to false if the user is not already a participant
    @participation.host = false if @participation.tasting.host_participation

    @participation.status = "pending"
    authorize @participation 
    if @participation.save
      Message.create(content: @participation.initial_message, sender: current_user, recipient: @tasting.host)
      create_notification
      redirect_to dashboard_path
    else
      @host = @tasting.host
      render "/tastings/show"
    end
  end

  def update
    @participation = Participation.find(params[:id])
    authorize @participation
    if @participation.update(participation_params)
      @tasting = @participation.tasting
      redirect_to tasting_path(@tasting)
    else
      @dashboard = Dashboard.new(current_user)
      render "/dashboards/show"
    end
  end

  private

  def participation_params
    params.require(:participation).permit(:initial_message, :status)
  end

  def create_notification
    Notification.create(
      user: @participation.tasting.host, 
      text: render_to_string(partial: 'notifications/participations/request', locals: {participation: @participation})
    )
  end
end
