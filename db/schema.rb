# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_21_200735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "configurations", force: :cascade do |t|
    t.integer "external_id"
    t.integer "launch_library_id"
    t.string "url"
    t.string "name"
    t.string "family"
    t.string "full_name"
    t.string "variant"
    t.bigint "rocket_id", null: false
    t.index ["rocket_id"], name: "index_configurations_on_rocket_id"
  end

  create_table "launch_service_providers", force: :cascade do |t|
    t.integer "external_id"
    t.string "url"
    t.string "name"
    t.string "type_launch_service_provider"
    t.bigint "launcher_id", null: false
    t.index ["launcher_id"], name: "index_launch_service_providers_on_launcher_id"
  end

  create_table "launchers", force: :cascade do |t|
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
    t.string "imported_t"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.integer "external_id"
    t.string "url"
    t.string "name"
    t.string "country_code"
    t.string "map_image"
    t.integer "total_launch_count"
    t.integer "total_landing_count"
    t.bigint "pad_id", null: false
    t.index ["pad_id"], name: "index_locations_on_pad_id"
  end

  create_table "missions", force: :cascade do |t|
    t.integer "external_id"
    t.integer "launch_library_id"
    t.string "name"
    t.string "description"
    t.string "launch_designator"
    t.string "type_mission"
    t.bigint "launcher_id", null: false
    t.index ["launcher_id"], name: "index_missions_on_launcher_id"
  end

  create_table "orbits", force: :cascade do |t|
    t.integer "external_id"
    t.string "name"
    t.string "abbrev"
    t.bigint "mission_id", null: false
    t.index ["mission_id"], name: "index_orbits_on_mission_id"
  end

  create_table "pads", force: :cascade do |t|
    t.integer "external_id"
    t.string "url"
    t.integer "agency_id"
    t.string "name"
    t.string "info_url"
    t.string "wiki_url"
    t.string "map_url"
    t.string "latitude"
    t.string "longitude"
    t.string "map_image"
    t.integer "total_launch_count"
    t.bigint "launcher_id", null: false
    t.index ["launcher_id"], name: "index_pads_on_launcher_id"
  end

  create_table "rockets", force: :cascade do |t|
    t.integer "external_id"
    t.bigint "launcher_id", null: false
    t.index ["launcher_id"], name: "index_rockets_on_launcher_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "external_id"
    t.string "name"
    t.bigint "launcher_id", null: false
    t.index ["launcher_id"], name: "index_statuses_on_launcher_id"
  end

  add_foreign_key "configurations", "rockets"
  add_foreign_key "launch_service_providers", "launchers"
  add_foreign_key "locations", "pads"
  add_foreign_key "missions", "launchers"
  add_foreign_key "orbits", "missions"
  add_foreign_key "pads", "launchers"
  add_foreign_key "rockets", "launchers"
  add_foreign_key "statuses", "launchers"
end
