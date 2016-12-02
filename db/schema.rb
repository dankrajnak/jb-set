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

ActiveRecord::Schema.define(version: 20161202221319) do

  create_table "background_infos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "jb_region"
    t.string   "national_jb"
    t.string   "local_jb"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_background_infos_on_user_id"
  end

  create_table "local_surveys", force: :cascade do |t|
    t.string   "jb_region"
    t.string   "national_jb"
    t.string   "local_jb"
    t.integer  "nun_local_events"
    t.integer  "num_related"
    t.integer  "age_group"
    t.integer  "num_jbers"
    t.string   "gender_ratio"
    t.boolean  "represented"
    t.boolean  "good_relationship"
    t.boolean  "awareness_of_meetings"
    t.integer  "num_local_attenders"
    t.integer  "num_regional_attenders"
    t.integer  "num_international_attenders"
    t.boolean  "participates"
    t.boolean  "knowGoals"
    t.boolean  "GQ1"
    t.boolean  "GQ2"
    t.boolean  "GQ3"
    t.boolean  "GQ4"
    t.boolean  "GQ5"
    t.boolean  "GQ6"
    t.boolean  "GQ7"
    t.boolean  "GQ8"
    t.boolean  "GQ9"
    t.boolean  "G2Q1"
    t.boolean  "G2Q2"
    t.boolean  "G2Q3"
    t.boolean  "G2Q4"
    t.boolean  "G2Q5"
    t.boolean  "G2Q6"
    t.boolean  "G3Q1"
    t.boolean  "G3Q2"
    t.boolean  "G3Q3"
    t.boolean  "G3Q4"
    t.boolean  "G3Q5"
    t.boolean  "G4Q1"
    t.boolean  "G4Q2"
    t.boolean  "G4Q3"
    t.boolean  "G4Q4"
    t.string   "G4Q5"
    t.string   "G4Q6"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "rapidfire_answers", force: :cascade do |t|
    t.integer  "attempt_id"
    t.integer  "question_id"
    t.text     "answer_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attempt_id"], name: "index_rapidfire_answers_on_attempt_id"
    t.index ["question_id"], name: "index_rapidfire_answers_on_question_id"
  end

  create_table "rapidfire_attempts", force: :cascade do |t|
    t.integer  "survey_id"
    t.string   "user_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["survey_id"], name: "index_rapidfire_attempts_on_survey_id"
    t.index ["user_id", "user_type"], name: "index_rapidfire_attempts_on_user_id_and_user_type"
  end

  create_table "rapidfire_questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.string   "type"
    t.string   "question_text"
    t.integer  "position"
    t.text     "answer_options"
    t.text     "validation_rules"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["survey_id"], name: "index_rapidfire_questions_on_survey_id"
  end

  create_table "rapidfire_surveys", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
