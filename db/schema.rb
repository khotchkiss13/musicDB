ActiveRecord::Schema.define(version: 20151210062219) do

  create_table "groups", force: :cascade do |t|
    t.string   "name"            null: false
    t.date     "formation_date"
    t.date     "disband_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "individuals", force: :cascade do |t|
    t.string   "name"                  null: false
    t.date     "birth_date"
    t.string   "primary_instrument"
    t.string   "secondary_instrument"
    t.string   "vocals"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "individual_id"  null: false
    t.integer  "group_id"       null: false
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "produced_by", force: :cascade do |t|
    t.integer "individual_id"   null: false
    t.integer "song_id"         null: false
  end

  create_table "record_labels", force: :cascade do |t|
    t.string   "name"            null: false
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
    t.integer  "group_id"         null: false
    t.string   "name"             null: false
    t.date     "date"             null: false
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
    t.integer "show_id"           null: false
    t.integer "track_id"          null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string   "name"          null: false
    t.string   "venue"         null: false
    t.date     "date"          null: false
    t.integer  "tickets_sold"
    t.integer  "total_profit"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "group_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "name"        null: false
    t.string   "genre"
    t.integer  "length"
    t.integer  "bpm"
    t.string   "medium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.integer  "track_number"  null: false
    t.integer  "song_id"       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "release_id"
  end

  create_table "written_by", force: :cascade do |t|
    t.integer "individual_id"  null: false
    t.integer "song_id"        null: false
  end

end
