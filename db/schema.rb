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

ActiveRecord::Schema.define(version: 20170315064438) do

  create_table "question_answers", force: :cascade do |t|
    t.integer  "users_id"
    t.integer  "questions_id"
    t.text     "answer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["questions_id"], name: "index_question_answers_on_questions_id"
    t.index ["users_id"], name: "index_question_answers_on_users_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "surveys_id"
    t.index ["surveys_id"], name: "index_questions_on_surveys_id"
  end

  create_table "survey_completions", force: :cascade do |t|
    t.integer  "users_id"
    t.integer  "surveys_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["surveys_id"], name: "index_survey_completions_on_surveys_id"
    t.index ["users_id"], name: "index_survey_completions_on_users_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
    t.boolean  "national"
    t.boolean  "local"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "country"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.boolean  "is_national",     null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "position"
  end

end
