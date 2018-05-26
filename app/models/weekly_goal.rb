class WeeklyGoal < ApplicationRecord
  belongs_to :category_id
  belongs_to :app_id
end
