class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stats

  def index
  end

  private

  def set_stats
    @stat_1 = 0
    @stat_2 = 0
    @stat_3 = 0
    @stat_4 = 0
  end
end
