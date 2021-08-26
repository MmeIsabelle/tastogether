class TastingsController < ApplicationController

  def index
    @tastings = policy_scope(Tasting).order(created_at: :desc)
  end

  def show
    @tasting = Tasting.find(params[:id])
    @participation = Participation.new
    @host = @tasting.participations.find_by(host: true).user
    authorize(@tasting)
  end

  def create
    @tasting = Tasting.new(tasting_params)
    @tasting.host = current_user
    authorize @tasting
    if @tasting.save
      redirect_to dashboard_path
    else
      @dashboard = Dashboard.new(current_user)
      render "/dashboards/show"
    end
  end

  private

  def tasting_params
    params.require(:tasting).permit(:title, :description, :location, :date, :capacity)
  end
end
