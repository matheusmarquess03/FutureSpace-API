class CreateLaunchServiceProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :launch_service_providers do |t|
      t.integer :external_id
      t.string :url
      t.string :name
      t.string :type_launch_service_provider
      t.references :launcher, null: false, foreign_key: true
    end
  end
end
