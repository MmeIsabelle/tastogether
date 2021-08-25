class DashboardsController < ApplicationController
  def show
  end

  def show
    @dashboard = Dashboard.new(current_user)
    @tasting = Tasting.new
    authorize @dashboard
  end
end
