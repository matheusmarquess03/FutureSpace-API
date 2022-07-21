class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :external_id
      t.string :url
      t.string :name
      t.string :country_code
      t.string :map_image
      t.integer :total_launch_count
      t.integer :total_landing_count
      t.references :pad, null: false, foreign_key: true
    end
  end
end
