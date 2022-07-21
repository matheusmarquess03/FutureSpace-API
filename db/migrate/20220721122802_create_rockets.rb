class CreateRockets < ActiveRecord::Migration[6.0]
  def change
    create_table :rockets do |t|
      t.integer :external_id
      t.references :launcher, null: false, foreign_key: true
    end
  end
end
