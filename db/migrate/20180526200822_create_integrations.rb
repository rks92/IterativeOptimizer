class CreateIntegrations < ActiveRecord::Migration[5.1]
  def change
    create_table :integrations do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :key
      t.string :details

      t.timestamps
    end
  end
end
