json.extract! weekly_goal, :id, :begin_date, :end_date, :fault_tolerance, :momentum, :category_id, :app_id, :target_time_min, :successful, :actual_time_min, :days_goal_completed, :created_at, :updated_at, :category, :app
json.url weekly_goal_url(weekly_goal, format: :json)
