class TastingsController < ApplicationController
  def index
    @tastings = policy_scope(Tasting).order(start_at: :asc)
    if params[:query].present?
      @tastings = @tastings.search_by_params(params[:query])
    else
      @tastings = @tastings.all
    end
    @tastings = @tastings.all.reject { |tasting| tasting.start_at < DateTime.now + 0.5 }
    @tastings = @tastings.sort_by { |tasting| current_user.distance_to([tasting.latitude, tasting.longitude])}
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
    if @tasting.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def tasting_params
    params.require(:tasting).permit(:title, :description, :location, :start_at, :capacity, :photo, category_ids: [])
  end
end
