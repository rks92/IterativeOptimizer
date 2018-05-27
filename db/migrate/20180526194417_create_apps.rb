class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps do |t|
      t.string :name
      t.integer :productivity_score
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
