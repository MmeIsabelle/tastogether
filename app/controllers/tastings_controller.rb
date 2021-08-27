class TastingsController < ApplicationController
  def index
    @tastings = policy_scope(Tasting).order(created_at: :desc)
    if params[:query].present?
      @tastings = @tastings.search_by_params(params[:query])
    else
      @tastings.all
    end
  end

  def show
    @tasting = Tasting.find(params[:id])
    @participation = Participation.new
    @host = @tasting.host
    authorize(@tasting)
  end

  def new
    @tasting = Tasting.new
    authorize @tasting
  end

  def create
    @tasting = Tasting.new(tasting_params)
    @tasting.host = current_user
    authorize @tasting
    if @tasting.save!
      redirect_to dashboard_path
    else
      # @dashboard = Dashboard.new(current_user)
      render :new
    end
  end

  private

  def tasting_params
    params.require(:tasting).permit(:title, :description, :location, :date, :capacity, :photo)
  end
end
