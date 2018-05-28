class DashboardController < ApplicationController
	def index
		@weekly_stats = WeeklyGoal.weekly_category_sums
	end
end
