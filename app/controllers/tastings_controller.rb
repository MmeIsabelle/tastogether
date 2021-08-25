class TastingsController < ApplicationController

  def index
    @tastings = policy_scope(Tasting).order(created_at: :desc)
  end

  def show
    @tasting = Tasting.find(params[:id])
    @participation = Participation.new
    authorize(@tasting)
  end

  def create

  end
end
