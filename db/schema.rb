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

ActiveRecord::Schema.define(version: 20161129024634) do

  create_table "background_infos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "jb_region"
    t.string   "national_jb"
    t.string   "local_jb"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_background_infos_on_user_id"
  end

  create_table "size_and_capacities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "num_events"
    t.integer  "num_related_area"
    t.string   "age_group"
    t.integer  "involved"
    t.string   "gender_info"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_size_and_capacities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.date     "date_of_birth",   null: false
    t.boolean  "is_national",     null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
