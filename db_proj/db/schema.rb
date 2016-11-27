# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150114175222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_sections", force: true do |t|
    t.integer  "recipe_section_id"
    t.integer  "section_comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "comment_text"
    t.integer  "refers_to"
    t.string   "comment_user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: true do |t|
    t.string  "owner_user_name"
    t.integer "product_id"
  end

  add_index "inventories", ["product_id"], name: "inventory_product_id_key", unique: true, using: :btree

  create_table "products", force: true do |t|
    t.string   "prod_name"
    t.integer  "quantity"
    t.string   "mesure_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_prods", force: true do |t|
    t.integer  "recipes_id"
    t.integer  "prods_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "recipe_name"
    t.text     "description"
    t.string   "recipe_writer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_accounts", primary_key: "username", force: true do |t|
    t.string   "email"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.integer  "id",              default: "nextval('user_accounts_id_seq'::regclass)", null: false
  end

end
