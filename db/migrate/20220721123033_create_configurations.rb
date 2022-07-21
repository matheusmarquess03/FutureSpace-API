class CreateConfigurations < ActiveRecord::Migration[6.0]
  def change
    create_table :configurations do |t|
      t.integer :external_id
      t.integer :launch_library_id
      t.string :url
      t.string :name
      t.string :family
      t.string :full_name
      t.string :variant
      t.references :rocket, null: false, foreign_key: true
    end
  end
end
