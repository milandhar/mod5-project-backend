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

ActiveRecord::Schema.define(version: 2019_07_19_004805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.integer "project_count"
    t.string "iso3166CountryCode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.integer "Gg_organization_id"
    t.string "city"
    t.string "country"
    t.text "mission"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "country_id"
    t.integer "theme_id"
  end

  create_table "project_donation_options", force: :cascade do |t|
    t.integer "project_id"
    t.integer "amount"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.float "funding"
    t.float "goal"
    t.string "image_url"
    t.float "latitude"
    t.float "longitude"
    t.text "long_term_impact"
    t.text "need"
    t.integer "gg_organization_id"
    t.string "status"
    t.string "summary"
    t.string "theme_str_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "country_id"
    t.integer "organization_id"
    t.integer "theme_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "theme_str_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_starred_projects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "theme_interest_1", default: ""
    t.string "theme_interest_2", default: ""
    t.string "theme_interest_3", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
