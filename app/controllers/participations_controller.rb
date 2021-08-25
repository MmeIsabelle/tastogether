class ParticipationsController < ApplicationController
  def create
    @tasting = Tasting.find(params[:tasting_id])
    @participation = Participation.new(participation_params)
    @participation.tasting = @tasting
    @participation.user = current_user

    # set the host attribute to false if the user is not already a participant
    @participation.host = false if @participation.tasting.participations.where(user: current_user).none?

    authorize(@participation)
    @participation.status = "pending"
    if @participation.save!
      redirect_to dashboard_path
    else
      render "/tastings/:tasting_id"
    end
  end

  def update
  end

  def participation_params
    params.require(:participation).permit(:initial_message)
  end
end
