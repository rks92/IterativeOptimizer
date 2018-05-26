class CreateWeeklyGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :weekly_goals do |t|
      t.date :begin_date
      t.date :end_date
      t.integer :fault_tolerance
      t.integer :momentum
      t.references :category_id, foreign_key: true
      t.references :app_id, foreign_key: true
      t.integer :target_time_min
      t.boolean :successful
      t.integer :actual_time_min
      t.integer :days_goal_completed

      t.timestamps
    end
  end
end
