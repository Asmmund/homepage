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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120815080340) do

  create_table "admin_data", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "asatru_articles", :force => true do |t|
    t.integer "page",                       :null => false
    t.string  "name", :limit => 50,         :null => false
    t.text    "text", :limit => 2147483647, :null => false
  end

  create_table "asatru_metadata", :force => true do |t|
    t.string "page",        :limit => 40, :null => false
    t.string "title",       :limit => 50, :null => false
    t.text   "description",               :null => false
    t.text   "keywords",                  :null => false
  end

  create_table "asatru_news", :force => true do |t|
    t.timestamp "date",                    :null => false
    t.string    "subtitle", :limit => 250
    t.text      "text"
    t.integer   "public"
  end

  add_index "asatru_news", ["public", "id"], :name => "public"

  create_table "elmor_articles", :force => true do |t|
    t.string "page", :limit => 20,         :null => false
    t.string "name", :limit => 50,         :null => false
    t.text   "text", :limit => 2147483647, :null => false
  end

  create_table "elmor_guest", :force => true do |t|
    t.timestamp "date",               :null => false
    t.string    "name", :limit => 30, :null => false
    t.text      "text",               :null => false
  end

  create_table "elmor_info", :force => true do |t|
    t.integer "page",                       :null => false
    t.string  "name", :limit => 50,         :null => false
    t.text    "text", :limit => 2147483647, :null => false
  end

  create_table "elmor_jquery", :force => true do |t|
    t.timestamp "date",                       :null => false
    t.string    "name", :limit => 50,         :null => false
    t.text      "text", :limit => 2147483647, :null => false
  end

  create_table "elmor_metadata", :force => true do |t|
    t.string "page",        :limit => 10, :null => false
    t.string "title",       :limit => 50, :null => false
    t.text   "description",               :null => false
    t.text   "keywords",                  :null => false
  end

  create_table "elmor_news", :force => true do |t|
    t.timestamp "date", :null => false
    t.text      "text", :null => false
  end

  create_table "elmor_user", :force => true do |t|
    t.timestamp "date",                   :null => false
    t.string    "login",    :limit => 50, :null => false
    t.string    "password", :limit => 32, :null => false
    t.string    "hash",     :limit => 32, :null => false
    t.string    "email",    :limit => 50, :null => false
    t.integer   "activate",               :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
