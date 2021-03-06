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

ActiveRecord::Schema.define(version: 20170531032651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "question_answers", force: :cascade do |t|
    t.text     "answer"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "question_id"
    t.integer  "survey_completion_id"
    t.index ["question_id"], name: "index_question_answers_on_question_id", using: :btree
    t.index ["survey_completion_id"], name: "index_question_answers_on_survey_completion_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "survey_id"
    t.string   "qtype"
    t.integer  "qorder"
    t.boolean  "required"
    t.index ["survey_id"], name: "index_questions_on_survey_id", using: :btree
  end

  create_table "survey_completions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "survey_id"
    t.string   "country"
    t.index ["survey_id"], name: "index_survey_completions_on_survey_id", using: :btree
    t.index ["user_id"], name: "index_survey_completions_on_user_id", using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
    t.boolean  "national"
    t.boolean  "local"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "about"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "position"
  end

end
