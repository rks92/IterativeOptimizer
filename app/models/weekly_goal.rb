class WeeklyGoal < ApplicationRecord
  belongs_to :category
  belongs_to :app

  scope :with_user, -> {  } 
  scope :with_details, -> { includes(:category, :app) } #TODO with_user
  scope :last_four_weeks, -> { with_details.group(:begin_date).order('begin_date desc').limit(5) }

  def self.last_month_category_sums
  end

  def self.all_time_category_sums
  	WeeklyGoal.with_details.group(:category).order('sum_actual_time_min desc').sum(:actual_time_min)
  end

  def self.all_time_app_sums
  	WeeklyGoal.with_details.group(:app).order('sum_actual_time_min desc').sum(:actual_time_min)
  end

  def self.weekly_category_sums
  	WeeklyGoal.includes(:category).group(:begin_date, "categories.name").order('begin_date', 'sum_actual_time_min desc').sum(:actual_time_min)
  end
end