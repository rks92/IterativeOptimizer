class CreateInitialTables < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |t|
      t.string :handle

      t.timestamps
    end

    create_table :integrations do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :key
      t.string :details

      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
      t.integer :productivity_score

      t.timestamps
    end

    create_table :apps do |t|
      t.string :name
      t.integer :productivity_score
      t.references :category, foreign_key: true

      t.timestamps
    end

    create_table :longterm_goals do |t|
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :target_time_min
      t.integer :actual_time_min
      t.boolean :successful

      t.timestamps
    end

    create_table :weekly_goals do |t|
      t.date :begin_date
      t.date :end_date
      t.float :fault_tolerance
      t.float :momentum
      t.references :category, foreign_key: true
      t.references :app, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :target_time_min
      t.boolean :successful
      t.integer :actual_time_min
      t.integer :days_goal_completed

      t.timestamps
    end
  end
end
