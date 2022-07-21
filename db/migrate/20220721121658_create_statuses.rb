class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.integer :external_id
      t.string :name
      t.references :launcher, null: false, foreign_key: true
    end
  end
end
