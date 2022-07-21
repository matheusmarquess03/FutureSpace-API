class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.integer :external_id
      t.integer :launch_library_id
      t.string :name
      t.string :description
      t.string :launch_designator
      t.string :type_mission
      t.references :launcher, null: false, foreign_key: true
    end
  end
end
