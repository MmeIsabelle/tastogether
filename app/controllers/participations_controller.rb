class ParticipationsController < ApplicationController
  def create
    @tasting = Tasting.find(params[:tasting_id])
    @participation = Participation.new(participation_params)
    authorize(@participation)
    @participation.user = current_user
    @participation.tasting = @tasting
    @participation.host = false
    @participation.status = "Pending"
    if @participation.save!
      redirect_to "/"
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
