# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2017_02_28_033544) do
  create_table "events", force: :cascade do |t|
    t.datetime "begins_at", precision: nil
    t.integer "ride_id"
    t.integer "route_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "notifiers", force: :cascade do |t|
    t.boolean "enabled"
    t.string "type"
    t.string "recipient"
    t.integer "ride_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "rides", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "map_url"
    t.integer "ride_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "slug"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

end
