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

ActiveRecord::Schema[7.1].define(version: 2024_01_05_175412) do
  create_table "habit_completions", force: :cascade do |t|
    t.integer "habit_id", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habit_id", "date"], name: "index_habit_completions_on_habit_id_and_date", unique: true
    t.index ["habit_id"], name: "index_habit_completions_on_habit_id"
  end

  create_table "habits", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passcodes", force: :cascade do |t|
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_items", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "shopping_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_items_on_recipe_id"
    t.index ["shopping_item_id"], name: "index_recipe_items_on_shopping_item_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title", limit: 30
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_recipes_on_title", unique: true
  end

  create_table "scratchpads", force: :cascade do |t|
    t.text "contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.boolean "stock"
    t.integer "shopping_category_id", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopping_category_id"], name: "index_shopping_items_on_shopping_category_id"
    t.index ["title"], name: "index_shopping_items_on_title", unique: true
  end

  add_foreign_key "habit_completions", "habits"
  add_foreign_key "recipe_items", "recipes"
  add_foreign_key "recipe_items", "shopping_items"
  add_foreign_key "shopping_items", "shopping_categories"
end
