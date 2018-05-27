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

ActiveRecord::Schema.define(version: 20180526194335) do

  create_table "apps", force: :cascade do |t|
    t.string "name"
    t.integer "productivity_score"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_apps_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "productivity_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "integrations", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "key"
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_integrations_on_user_id"
  end

  create_table "longterm_goals", force: :cascade do |t|
    t.integer "category_id"
    t.integer "user_id"
    t.integer "target_time_min"
    t.integer "actual_time_min"
    t.boolean "successful"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_longterm_goals_on_category_id"
    t.index ["user_id"], name: "index_longterm_goals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "handle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weekly_goals", force: :cascade do |t|
    t.date "begin_date"
    t.date "end_date"
    t.float "fault_tolerance"
    t.float "momentum"
    t.integer "category_id"
    t.integer "app_id"
    t.integer "user_id"
    t.integer "target_time_min"
    t.boolean "successful"
    t.integer "actual_time_min"
    t.integer "days_goal_completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_weekly_goals_on_app_id"
    t.index ["category_id"], name: "index_weekly_goals_on_category_id"
    t.index ["user_id"], name: "index_weekly_goals_on_user_id"
  end

end
