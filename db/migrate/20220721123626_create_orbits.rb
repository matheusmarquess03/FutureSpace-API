class CreateOrbits < ActiveRecord::Migration[6.0]
  def change
    create_table :orbits do |t|
      t.integer :external_id
      t.string :name
      t.string :abbrev
      t.references :mission, null: false, foreign_key: true
    end
  end
end
