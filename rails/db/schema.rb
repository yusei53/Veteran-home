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

ActiveRecord::Schema[7.0].define(version: 2023_08_24_012834) do
  create_table "assessment_areas", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_assessment_areas_on_city_id"
    t.index ["store_id"], name: "index_assessment_areas_on_store_id"
  end

  create_table "assessment_users", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "yomi"
    t.string "email"
    t.date "assessment_request_date", null: false
    t.boolean "is_received", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gender_id"
    t.integer "age"
    t.bigint "city_id"
    t.string "address"
    t.index ["city_id"], name: "index_assessment_users_on_city_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "prefecture_id", null: false
    t.string "name", null: false
    t.string "yomi", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "ieul_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "original_reviews", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "store_id", null: false
    t.bigint "assessment_user_id", null: false
    t.string "property_address", null: false
    t.integer "property", null: false, comment: "物件種別"
    t.integer "num_sale", null: false, comment: "売却回数は選択肢"
    t.date "date_considered", null: false
    t.date "date_assessment", null: false
    t.date "start_sale", null: false
    t.date "end_sale", null: false
    t.date "date_handover", null: false
    t.integer "score_speed", null: false
    t.integer "price_assessment", null: false
    t.integer "price_sale", null: false
    t.boolean "is_discount", default: false, null: false
    t.integer "discount_n_month_later", comment: "売り出してから何ヶ月後に値下げしたか"
    t.integer "price_discount"
    t.integer "price_contract", null: false
    t.integer "score_contract", null: false
    t.integer "contract_type", null: false
    t.text "headline", null: false
    t.integer "reason_sale", null: false, comment: "売却理由は選択肢"
    t.text "anxiety", null: false
    t.text "reason_decision", null: false
    t.integer "score_store", null: false, comment: "対応満足度"
    t.text "reason_score", null: false
    t.text "advice", null: false
    t.text "improvement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_user_id"], name: "index_original_reviews_on_assessment_user_id"
    t.index ["city_id"], name: "index_original_reviews_on_city_id"
    t.index ["store_id"], name: "index_original_reviews_on_store_id"
  end

  create_table "prefectures", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prefecture_id"
  end

  create_table "public_reviews", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "original_review_id", null: false
    t.string "property_address", null: false
    t.integer "property", null: false, comment: "物件種別"
    t.integer "num_sale", null: false, comment: "売却回数は選択肢"
    t.date "date_considered", null: false
    t.date "date_assessment", null: false
    t.date "start_sale", null: false
    t.date "end_sale", null: false
    t.date "date_handover", null: false
    t.integer "score_speed", null: false
    t.integer "price_assessment", null: false
    t.integer "price_sale", null: false
    t.boolean "is_discount", default: false, null: false
    t.integer "discount_n_month_later", comment: "売り出してから何ヶ月後に値下げしたか"
    t.integer "price_discount"
    t.integer "price_contract", null: false
    t.integer "score_contract", null: false
    t.integer "contract_type", null: false
    t.text "headline", null: false
    t.integer "reason_sale", null: false, comment: "売却理由は選択肢"
    t.text "anxiety", null: false
    t.text "reason_decision", null: false
    t.integer "score_store", null: false, comment: "対応満足度"
    t.text "reason_score", null: false
    t.text "advice", null: false
    t.text "improvement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["original_review_id"], name: "index_public_reviews_on_original_review_id"
  end

  create_table "stores", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "city_id", null: false
    t.bigint "ieul_store_id"
    t.string "name"
    t.string "logo_url", null: false
    t.string "post_code"
    t.string "address", null: false
    t.string "phone_number"
    t.string "fax_number"
    t.string "open_time"
    t.string "holiday"
    t.string "catch_copy", null: false
    t.string "introduction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_stores_on_city_id"
    t.index ["company_id"], name: "index_stores_on_company_id"
  end

  add_foreign_key "assessment_areas", "cities"
  add_foreign_key "assessment_areas", "stores"
  add_foreign_key "assessment_users", "cities"
  add_foreign_key "cities", "prefectures"
  add_foreign_key "original_reviews", "assessment_users"
  add_foreign_key "original_reviews", "cities"
  add_foreign_key "original_reviews", "stores"
  add_foreign_key "public_reviews", "original_reviews"
  add_foreign_key "stores", "cities"
  add_foreign_key "stores", "companies"
end
