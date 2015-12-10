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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151210062219) do

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.date     "formation_date"
    t.date     "disband_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "individuals", force: :cascade do |t|
    t.string   "name"
    t.date     "birth_date"
    t.string   "primary_instrument"
    t.string   "secondary_instrument"
    t.string   "vocals"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "individual_id"
    t.integer  "group_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "produced_by", force: :cascade do |t|
    t.integer "individual_id"
    t.integer "song_id"
  end

  create_table "record_labels", force: :cascade do |t|
    t.string   "name"
    t.string   "founder"
    t.string   "location"
    t.string   "ceo"
    t.date     "date_founded"
    t.date     "date_dissolved"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "releases", force: :cascade do |t|
    t.integer  "record_label_id"
    t.integer  "group_id"
    t.string   "name"
    t.date     "date"
    t.string   "media_type"
    t.integer  "total_length"
    t.integer  "copies_sold"
    t.integer  "total_profit"
    t.string   "medium"
    t.string   "certification"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "set_lists", force: :cascade do |t|
    t.integer "show_id"
    t.integer "track_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string   "name"
    t.string   "venue"
    t.date     "date"
    t.integer  "tickets_sold"
    t.integer  "total_profit"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "group_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "name"
    t.string   "genre"
    t.integer  "length"
    t.integer  "bpm"
    t.string   "medium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.integer  "track_number"
    t.integer  "song_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "release_id"
  end

  create_table "written_by", force: :cascade do |t|
    t.integer "individual_id"
    t.integer "song_id"
  end

end
