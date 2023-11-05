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

ActiveRecord::Schema[7.1].define(version: 2023_11_04_231521) do
  create_table "shopping_categories", force: :cascade do |t|
    t.string "title", limit: 20
    t.string "color", default: "white"
    t.text "notes"
    t.integer "importance", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_shopping_categories_on_title", unique: true
  end

  create_table "shopping_items", force: :cascade do |t|
    t.string "title", limit: 20
    t.integer "stock", default: 0
    t.integer "shopping_category_id", null: false
    t.text "notes"
    t.integer "importance", default: 1
    t.string "unit", default: "kg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopping_category_id"], name: "index_shopping_items_on_shopping_category_id"
    t.index ["title"], name: "index_shopping_items_on_title", unique: true
  end

  add_foreign_key "shopping_items", "shopping_categories"
end
