class CreateLongtermGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :longterm_goals do |t|
      t.references :category, foreign_key: true
      t.integer :target_time_min
      t.integer :actual_time_min
      t.boolean :successful

      t.timestamps
    end
  end
end
