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

ActiveRecord::Schema.define(version: 2023_03_15_092553) do

  create_table "answers", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "id"
    t.integer "question_id"
    t.boolean "correct_answer"
    t.string "content"
  end

  create_table "categories", id: :integer, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
  end

  create_table "lessons", id: :integer, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.index ["category_id"], name: "category_id"
  end

  create_table "questions", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "id"
    t.integer "lesson_id"
    t.string "content"
    t.index ["lesson_id"], name: "lesson_id"
  end

  create_table "relationship", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "id"
    t.integer "follower_id"
    t.integer "followed_id"
  end

  create_table "results", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "id"
    t.integer "lesson_id"
    t.integer "user_id"
    t.integer "score"
    t.index ["lesson_id"], name: "lesson_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "users", id: :integer, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.boolean "admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", id: :integer, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.integer "category_id"
    t.string "word"
    t.string "meaning"
    t.string "note"
    t.index ["category_id"], name: "category_id"
  end

  add_foreign_key "lessons", "categories", name: "lessons_ibfk_1"
  add_foreign_key "questions", "lessons", name: "questions_ibfk_1"
  add_foreign_key "results", "lessons", name: "results_ibfk_2"
  add_foreign_key "results", "users", name: "results_ibfk_1"
  add_foreign_key "words", "categories", name: "words_ibfk_1"
end
