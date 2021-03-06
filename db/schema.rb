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

ActiveRecord::Schema.define(version: 2019_11_19_212747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
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
    t.string "country"
    t.integer "gg_project_id"
    t.string "project_link"
    t.text "activities"
    t.integer "donation_amounts", default: [], array: true
    t.text "donation_descriptions", default: [], array: true
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
    t.integer "order_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "theme1"
    t.integer "theme2"
    t.integer "theme3"
    t.string "default_country"
  end

end
