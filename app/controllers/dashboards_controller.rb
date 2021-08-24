class DashboardsController < ApplicationController
  def show
  end

  def show
    @dashboard = Dashboard.new(current_user)
    authorize @dashboard
  end
end
