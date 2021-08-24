class TastingsController < ApplicationController

  def index
    @tastings = policy_scope(Tasting).order(created_at: :desc)
  end

  def show

  end

  def create

  end
end
