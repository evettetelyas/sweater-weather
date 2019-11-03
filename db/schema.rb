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

ActiveRecord::Schema.define(version: 2019_11_02_230059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_forecasts", force: :cascade do |t|
    t.integer "day"
    t.string "summary"
    t.string "icon"
    t.float "precip_pct"
    t.float "high"
    t.float "low"
    t.bigint "forecast_id", null: false
    t.index ["forecast_id"], name: "index_daily_forecasts_on_forecast_id"
  end

  create_table "forecasts", force: :cascade do |t|
    t.string "current_summary"
    t.integer "current_time"
    t.string "daily_summary"
    t.float "high"
    t.float "low"
    t.string "icon"
    t.float "temp"
    t.float "feels_like"
    t.float "humidity"
    t.float "visibility"
    t.string "uv_index"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hourly_forecasts", force: :cascade do |t|
    t.integer "time"
    t.float "temp"
    t.bigint "forecast_id", null: false
    t.index ["forecast_id"], name: "index_hourly_forecasts_on_forecast_id"
  end

  add_foreign_key "daily_forecasts", "forecasts"
  add_foreign_key "hourly_forecasts", "forecasts"
end
