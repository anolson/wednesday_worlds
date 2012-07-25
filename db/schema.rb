# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120725013025) do

  create_table "administrators", :force => true do |t|
    t.string   "name"
    t.string   "twitter_screen_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifiers", :force => true do |t|
    t.boolean  "enabled"
    t.string   "type"
    t.string   "recipient"
    t.integer  "ride_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "occurrences", :force => true do |t|
    t.boolean  "recurs"
    t.string   "recurrence_type"
    t.date     "recurrence_ends_at"
    t.datetime "begins_at"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rides", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.boolean  "currently_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "map_url"
    t.integer  "ride_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
