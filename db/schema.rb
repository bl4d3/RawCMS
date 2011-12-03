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

ActiveRecord::Schema.define(:version => 20111203175054) do

  create_table "admins", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "containers", :force => true do |t|
    t.string   "name"
    t.string   "sub_title"
    t.string   "place_holder"
    t.text     "description"
    t.integer  "parent_id"
    t.boolean  "is_public"
    t.integer  "order_show"
    t.string   "template"
    t.string   "mtitle"
    t.string   "mkey"
    t.text     "mdescription"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_id"
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portfolios", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "skill"
    t.integer  "order_show"
    t.integer  "admin_id"
    t.boolean  "is_public"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.integer  "container_id"
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "short_description"
    t.text     "description"
    t.boolean  "is_public"
    t.integer  "category_id"
    t.integer  "admin_id"
    t.string   "tag_keyword"
    t.text     "text_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
