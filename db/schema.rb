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

ActiveRecord::Schema[7.0].define(version: 2023_07_03_181704) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "on_sheet_gss_characters", force: :cascade do |t|
    t.string "gensosenkyo_name", comment: "総選挙での名前"
    t.string "name", null: false, comment: "名前"
    t.boolean "has_nickname", comment: "別名を持つかどうか"
    t.boolean "exists_gs1", null: false, comment: "幻水Iに登場するかどうか"
    t.boolean "exists_gs2", null: false, comment: "幻水IIに登場するかどうか"
    t.boolean "exists_gs3", null: false, comment: "幻水IIIに登場するかどうか"
    t.boolean "exists_gs4", null: false, comment: "幻水IVに登場するかどうか"
    t.boolean "exists_gs5", null: false, comment: "幻水Vに登場するかどうか"
    t.boolean "exists_in_each_gaiden", null: false, comment: "各外伝に登場するかどうか"
    t.boolean "exists_gaiden1", null: false, comment: "幻水外伝1に登場するかどうか"
    t.boolean "exists_gaiden2", null: false, comment: "幻水外伝2に登場するかどうか"
    t.boolean "exists_rhapsodia", null: false, comment: "ラプソディアに登場するかどうか"
    t.boolean "exists_tk", null: false, comment: "TKに登場するかどうか"
    t.boolean "exists_tsumutoki", null: false, comment: "紡時に登場するかどうか"
    t.string "memo", comment: "備考"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "on_sheet_gss_section_cities", force: :cascade do |t|
    t.string "product_name", comment: "タイトル名"
    t.string "country_name", comment: "国名"
    t.string "city_name", comment: "都市名"
    t.boolean "is_available", comment: "利用可能かどうか"
    t.boolean "is_town_or_village_or_city", comment: "町か村か都市か"
    t.boolean "is_dungeon", comment: "ダンジョンかどうか"
    t.boolean "is_architecture", comment: "建造物かどうか"
    t.boolean "is_others", comment: "その他かどうか"
    t.string "memo", comment: "備考"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "on_sheet_gss_section_hq_characters", force: :cascade do |t|
    t.boolean "is_available", comment: "利用可能かどうか"
    t.string "product_name", comment: "タイトル名"
    t.string "character_name", comment: "キャラクター名"
    t.string "facility_or_position_name", comment: "施設名・役職名"
    t.string "role_of_hq_on_system", comment: "本拠地での役割（システム面）"
    t.string "note", comment: "備考"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "on_sheet_platforms", force: :cascade do |t|
    t.string "name", comment: "ゲーム機の機種名"
    t.string "name_en", comment: "ゲーム機の機種名（英語）"
    t.string "nickname", comment: "ゲーム機の略称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_on_sheet_platforms_on_name", unique: true
    t.index ["name_en"], name: "index_on_sheet_platforms_on_name_en", unique: true
  end

  create_table "on_sheet_stars", force: :cascade do |t|
    t.string "seating_order", comment: "108星の順番"
    t.string "name", comment: "108星の名前"
    t.string "name_en", comment: "108星の英語名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seating_order"], name: "index_on_sheet_stars_on_seating_order", unique: true
  end

  create_table "on_sheet_titles", force: :cascade do |t|
    t.string "name", comment: "作品名"
    t.string "name_en", comment: "作品名（英語）"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_on_sheet_titles_on_name", unique: true
    t.index ["name_en"], name: "index_on_sheet_titles_on_name_en", unique: true
  end

end
