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

ActiveRecord::Schema.define(version: 2021_08_28_212215) do

  create_table "links", force: :cascade do |t|
    t.string "original_url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "short_url_lists", force: :cascade do |t|
    t.string "short_url"
    t.integer "link_id"
    t.index ["link_id"], name: "index_short_url_lists_on_link_id"
  end

  create_table "user_links", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "link_id", null: false
    t.index ["link_id", "user_id"], name: "index_user_links_on_link_id_and_user_id"
    t.index ["user_id", "link_id"], name: "index_user_links_on_user_id_and_link_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "short_url_lists", "links"
end
