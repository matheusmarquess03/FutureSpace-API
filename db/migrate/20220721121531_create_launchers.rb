class CreateLaunchers < ActiveRecord::Migration[6.0]
  def change
    create_table :launchers do |t|
      t.string "external_id"
      t.string "url"
      t.integer "launch_library_id"
      t.string "slug"
      t.string "name"
      t.string "net"
      t.string "window_end"
      t.string "window_start"
      t.boolean "inhold"
      t.boolean "tbdtime"
      t.boolean "tbddate"
      t.integer "probability"
      t.string "holdreason"
      t.string "failreason"
      t.string "hashtag"
      t.string "map_image"
      t.integer "total_launch_count"
      t.boolean "webcast_live"
      t.string "image"
      t.string "infographic"
      t.string "program"
      t.date "imported_t"
      t.integer "status"

      t.timestamps
    end
  end
end
