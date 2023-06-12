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

ActiveRecord::Schema[7.0].define(version: 2023_06_12_232155) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stars", force: :cascade do |t|
    t.string "name", null: false, comment: "宿星の名前（日本語）"
    t.string "name_en", null: false, comment: "宿星の名前（英語）"
    t.integer "seating_order", null: false, comment: "席次"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_stars_on_name", unique: true
    t.index ["seating_order"], name: "index_stars_on_seating_order", unique: true
  end

  create_table "titles", force: :cascade do |t|
    t.string "name", null: false, comment: "作品タイトル名"
    t.string "name_en", null: false, comment: "作品タイトル名（英語）"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_titles_on_name", unique: true
    t.index ["name_en"], name: "index_titles_on_name_en", unique: true
  end

end
