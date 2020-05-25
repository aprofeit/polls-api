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

ActiveRecord::Schema.define(version: 2020_05_25_185602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "poll_options", force: :cascade do |t|
    t.bigint "poll_id", null: false
    t.string "label"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["poll_id"], name: "index_poll_options_on_poll_id"
  end

  create_table "poll_responses", force: :cascade do |t|
    t.string "answer"
    t.bigint "poll_id", null: false
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["poll_id"], name: "index_poll_responses_on_poll_id"
    t.index ["token"], name: "index_poll_responses_on_token", unique: true
  end

  create_table "polls", force: :cascade do |t|
    t.string "token"
    t.string "question"
    t.string "options"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_polls_on_token", unique: true
  end

  add_foreign_key "poll_options", "polls"
  add_foreign_key "poll_responses", "polls"
end
