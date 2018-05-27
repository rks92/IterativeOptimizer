class CreateCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :category do |t|
      t.string :name
      t.integer :productivity_score

      t.timestamps
    end
  end
end
