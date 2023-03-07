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

ActiveRecord::Schema.define(version: 0) do

  create_table "answer", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "id"
    t.integer "question_id"
    t.boolean "correct_answer"
    t.string "content"
  end

  create_table "category", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
  end

  create_table "lesson", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.index ["category_id"], name: "category_id"
  end

  create_table "question", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "id"
    t.integer "lesson_id"
    t.string "content"
    t.index ["lesson_id"], name: "lesson_id"
  end

  create_table "relationship", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "id"
    t.integer "follower_id"
    t.integer "followed_id"
  end

  create_table "result", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "id"
    t.integer "lesson_id"
    t.integer "user_id"
    t.integer "score"
    t.index ["lesson_id"], name: "lesson_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "user", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.boolean "admin"
  end

  create_table "word", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "id"
    t.integer "category_id"
    t.string "word"
    t.string "meaning"
    t.string "note"
    t.index ["category_id"], name: "category_id"
  end

  add_foreign_key "lesson", "category", name: "lesson_ibfk_1"
  add_foreign_key "question", "lesson", name: "question_ibfk_1"
  add_foreign_key "result", "lesson", name: "result_ibfk_2"
  add_foreign_key "result", "user", name: "result_ibfk_1"
  add_foreign_key "word", "category", name: "word_ibfk_1"
end
