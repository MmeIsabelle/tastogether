class TastingsController < ApplicationController
  def index
    @tastings = policy_scope(Tasting).order(start_at: :asc)
    if params[:query].present?
      @tastings = @tastings.search_by_params(params[:query])
    else
      @tastings = @tastings.all
    end
    @tastings = @tastings.all.reject { |tasting| tasting.start_at < DateTime.now + 0.5 }
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
      assign_categorization(@tasting)
      Participation.create(
        status: "accepted",
        host: true,
        user: @tasting.host,
        initial_message: nil,
        tasting: @tasting
      )
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def tasting_params
    params.require(:tasting).permit(:title, :description, :location, :start_at, :capacity, :photo)
  end

  def assign_categorization(tasting)
    category_ids = params[:tasting][:category_ids]
    if category_ids.instance_of?(Array)
      category_ids.each do |category|
        Categorization.create(tasting: tasting, category: Category.find(category)) if !category.nil? && category != ""
      end
    elsif !category_ids.nil? && category_ids != ""
      Categorization.create(tasting: tasting, category: Category.find(category_ids))
    end
  end
end
